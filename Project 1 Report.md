**ICCS 448 \- Mobile App \- Project 1 Report**  
Name: Haicheng Wang  
Student ID: 6580244  
project topic: currency converter

**Project description:**  
This project achieved a fixed-rate based currency converter.It allows users to select two currencies, enter an amount,and see the converted value instantly using predefined rates.   
I used the same way of our in class example to predefine the color of widget, background, text, buttons all together in constraints.dart. In DataEntryScreen, where the main screen sits, the currency 1 and currency 2 fields are drop down list that choosable to user, and I have defined in total 12 currency options now in that drop down list. Next to the currency 1, the text field is default to “Amount”, where gives a hint to user that this field can type in the currency 1 amount. Second base card is the currency 2, it is the same as the currency 1 which uses a drop down list to let users choose the currency 2, and next to it is a read only text field which is default to be 0, and once currency 1, amount 1 and currency 2 all are set, then this text field will show the corresponding value for currency 2 as amount 2\.  
This is achieved by simply define the onChanged field of DropdownButtonFormField and TextField to once the currency 1, amount 1, and currency 2 changed, it will assign the new value to that variable and call the \_recalculateAmount2() function.  
	The way I compute the rate ratio and the amount 2 is I set up a predefined Map\<String, double\> that contains all currency with its rate to chinese Yuan as key pairs, for example, the currency ‘CNY’ is mapped to 1.0 since CNY : CNY is 1:1 for sure, and others like ‘THB’ mapped to 0.22 since 1 baht is equal to roughly 0.22 chinese Yuan. So when I get to compute two unknow currency, I firstly change the currency 1 into CNY, and use CNY to compute CNY : currency 2, in this way I can get to calculate amount 2 by:  
rate1 \= map(currency\_1);  
rate2 \= map(currency\_2);  
amount2 \= amount1 \* rate1 / rate2;  
	After that, I defined a button underneath to the two base cards that shows “Show Rate”, and if currency 1 and currency 2 are specified, then this button will navigate to ResultScreen. In this screen, I used two base cards to show the ratio of currency 1 : currency 2 in the format of 1 : X, where X is the amount 2 calculated by setting the amount1 as 1\. In this screen I also used the techniques learned in class that use pub.dev to import country icons, and next to both currency name, I attach the country icons with the name to improve UX.  
	That is basically this project does, to extend on what I have now, I could think of maybe decorate more on it, right now what I achieved is just a plain and clean version. Also, ideally it should refresh the rate based on real time rate from the internet, and possibly on the result screen can show the diagram of currency 1 : currency 2 recent history rate, in this way, it will enhance the UX more and give more info to user to decide like when should they change the currency, and help them somehow predict the currency rate based on the history diagram(bar chart posssibly).  
Link to Figma UI peototype: [https://www.figma.com/design/4Qs6qGQDaq56uDghGepnU8/Currency-Convertor-Prototype?node-id=33-25\&t=XMYqDLhzZFaOfzDC-1](https://www.figma.com/design/4Qs6qGQDaq56uDghGepnU8/Currency-Convertor-Prototype?node-id=33-25&t=XMYqDLhzZFaOfzDC-1)

Link to git repo:   
[https://github.com/sorryma3er/currency-convertor-app.git](https://github.com/sorryma3er/currency-convertor-app.git)

