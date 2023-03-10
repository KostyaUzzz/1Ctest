
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.ПоступлениеТоваров.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ПоступлениеТоваров.Заказ,
	|	ПоступлениеТоваров.Дата,
	|	ПоступлениеТоваров.Номер,
	|	ПоступлениеТоваров.Поставщик,
	|	ПоступлениеТоваров.Склад,
	|	ПоступлениеТоваров.Товары.(
	|		НомерСтроки,
	|		Номенклатура,
	|		КоличествоТовара,
	|		ЦенаПоступления,
	|		Стоимость
	|	)
	|ИЗ
	|	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров
	|ГДЕ
	|	ПоступлениеТоваров.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();
	
	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок"); 
	
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьТоварыШапка = Макет.ПолучитьОбласть("ТоварыШапка");
	ОбластьТовары = Макет.ПолучитьОбласть("Товары");
	Подвал = Макет.ПолучитьОбласть("Подвал");
	
	ТабДок.Очистить();
	
	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		
		ОбластьЗаголовок.Параметры.Заполнить(Выборка); 
		ОбластьЗаголовок.Параметры.Номер = Выборка.Номер;
		ОбластьЗаголовок.Параметры.Дата = Формат(Выборка.Дата, "ДЛФ=DD");
		
		ТабДок.Вывести(ОбластьЗаголовок);
		
		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());
		
		ТабДок.Вывести(ОбластьТоварыШапка);
		ВыборкаТовары = Выборка.Товары.Выбрать(); 
		СуммаИтог = 0;
		
		Пока ВыборкаТовары.Следующий() Цикл
			ОбластьТовары.Параметры.Заполнить(ВыборкаТовары);
			ТабДок.Вывести(ОбластьТовары, ВыборкаТовары.Уровень()); 
			СуммаИтог = СуммаИтог + ВыборкаТовары.Стоимость;
			
		КонецЦикла;
		Подвал.Параметры.ВсегоПоДокументу = СуммаИтог;
		
		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);
		
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
