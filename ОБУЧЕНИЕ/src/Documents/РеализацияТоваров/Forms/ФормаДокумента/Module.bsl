&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	
	Элементы.Товары.ТекущиеДанные.ЦенаРеализации = ОпределитьЦенаРеализации(Элементы.Товары.ТекущиеДанные.Номенклатура);
	Элементы.Товары.ТекущиеДанные.Стоимость =  Элементы.Товары.ТекущиеДанные.Количество * Элементы.Товары.ТекущиеДанные.ЦенаРеализации; 

КонецПроцедуры

&НаСервере
Функция ОпределитьЦенаРеализации(Номенклатура)
	
	Возврат Номенклатура.ЦенаРеализации;	

КонецФункции

&НаКлиенте
Процедура ТоварыЦенаРеализацииПриИзменении(Элемент)
	
	Элементы.Товары.ТекущиеДанные.Стоимость =  Элементы.Товары.ТекущиеДанные.Количество * Элементы.Товары.ТекущиеДанные.ЦенаРеализации; 

 КонецПроцедуры

&НаКлиенте
 Процедура ТоварыКоличествоТовараПриИзменении(Элемент)
	 
	 Элементы.Товары.ТекущиеДанные.Стоимость =  Элементы.Товары.ТекущиеДанные.Количество * Элементы.Товары.ТекущиеДанные.ЦенаРеализации;
	 
 КонецПроцедуры

