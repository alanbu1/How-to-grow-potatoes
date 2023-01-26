%-----------------================+================-----------------%
% Name: Alan Bu                                                     %
% Student Number: 333862746                                         %
% ICS2O1-21 Mr. Lee                                                 %
% Date: 10 April 2019                                               %
% Assignment name: Summative                                        %
%-----------------================+================-----------------%
%                         Declaring Variables                       %
%-----------------================+================-----------------%
% Screen Dimensions
setscreen ("graphics:640;400")

% Font variables
var font1 : int := Font.New ("Times New Roman:50")
var font2 : int := Font.New ("Times New Roman:30:Italic")
var font3 : int := Font.New ("Times New Roman:40:Bold")
var font4 : int := Font.New ("Times New Roman:35:Bold")
var font5 : int := Font.New ("Times New Roman:50:Bold")
var font6 : int := Font.New ("Times New Roman:30:Bold")
var font7 : int := Font.New ("Times New Roman:25:")
var font8 : int := Font.New ("Times New Roman:15:")
var font9 : int := Font.New ("Times New Roman:18:")
var font10 : int := Font.New ("Times New Roman:80:Bold")

% Mousewhere
var x, y, b : int

% Background
var background : int := 80

% Title colour
var titlecolour : int := 28
% Program variables
var page : int := 1

% So the user does not proceed to the next procedure accidentally
procedure click
    loop
	mousewhere (x, y, b)
	exit when b = 0
    end loop
end click
%-----------------================+================-----------------%
%                             Next Button                           %
%-----------------================+================-----------------%
% Next button procedure
procedure next
    drawfillbox (500, 90, 600, 40, white)
    Font.Draw ("NEXT", 508, 55, font7, red)
end next

% Actual procedure to go to the next page
procedure next2
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 500 and x < 600) and (y < 90 and y > 40) then
		click
		page := page + 1
		cls
		exit
	    end if
	end if
    end loop
end next2

%-----------------================+================-----------------%
%                      Making of the menu screen                    %
%-----------------================+================-----------------%
% Menu screen boxes
procedure Menuscreen
    page := 1
    delay (100)
    cls
    delay (100)
    % Choose what you want to see
    Font.Draw ("Choose What You Want to Play", 50, 325, font6, white)

    % Boxes

    % Lesson
    drawfillbox (70, 275, 290, 175, white)
    Font.Draw ("Lesson", 105, 210, font3, red)
    % Animation
    drawfillbox (340, 275, 560, 175, white)
    Font.Draw ("Animation", 345, 210, font4, red)
    % Quiz
    drawfillbox (70, 140, 290, 40, white)
    Font.Draw ("Quiz", 105, 70, font5, red)
    % Exit
    drawfillbox (340, 140, 560, 40, white)
    Font.Draw ("Exit", 390, 70, font5, red)
end Menuscreen

% Menu button procedure
procedure menu
    drawfillbox (500, 90, 600, 40, white)
    Font.Draw ("MENU", 504, 55, font7, red)
    Font.Draw ("Click menu to go back to the menu", 180, 60, font8, white)
end menu

% Procedure to go back to menu
procedure menu2
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 500 and x < 600) and (y < 90 and y > 40) then
		click
		cls
		page += 0
		Menuscreen
		exit
	    end if
	end if
    end loop
end menu2

%-----------------================+================-----------------%
%                               Lesson                              %
%-----------------================+================-----------------%
% Page 1 of the lesson
procedure Lesson1
    delay (200)
    cls
    delay (200)
    Font.Draw ("Lesson", 240, 340, font3, white)
    locate (6, 10)
    put "1. First, if you want to grow potatoes, you need seed potatoes."
    locate (7, 10)
    put "2. Then, find a patch of soil and make sure it is weed-free."
    locate (8, 10)
    put "3. Add fertilizer in the soil and loosen the soil very well."
    locate (9, 10)
    put "4. Dig a hole around 10cm deep and plant the potato."
    locate (10, 10)
    put "5. Potatoes should be planted 30cm apart from each other."
    locate (11, 10)
    put "6. Water the potato once a week."
    locate (12, 10)
    put "7. Water around 5cm a week during the summertime."
    locate (13, 10)
    put "8. Build any extra soil around the base as they grow."
    locate (14, 10)
    put "9. Regularly remove any weed around the potatoes."
    locate (15, 10)
    put "10. Cut off the browning foilage as the potatoes mature."
    locate (16, 10)
    put "11. Depending on the type of potato, it can take 60 to 100 days"
    locate (17, 10)
    put "for a potato to mature."
    locate (18, 10)
    put "12. Maincrop potatoes can take 125 to 140 days to fully mature."
    Font.Draw ("Click next to continue", 250, 60, font8, white)
end Lesson1

% Page 2 of the lesson
procedure Lesson2
    Font.Draw ("Lesson", 240, 340, font3, white)
    locate (6, 10)
    put "13. Once all the foilage dies, give the potatoes a couple of more"
    locate (7, 10)
    put "weeks to mature."
    locate (8, 10)
    put "14. During this time, take a few potatoes out to check if they are"
    locate (9, 10)
    put "ready to be harvested"
    locate (10, 10)
    put "15. After a couple of weeks, dig your potatoes out."
    locate (11, 10)
    put "16. Clean the dirt off the potatoes."
    locate (12, 10)
    put "17. Congratulations! You learned how to grow potatoes!"
end Lesson2

% Actual lesson procedure
procedure Lesson
    loop
	case page of
	    label 1 :
		click
		Lesson1
		next
		next2
	    label 2 :
		click
		Lesson2
		menu
		menu2
		exit
	end case
    end loop
end Lesson

%-----------------================+================-----------------%
%                               Quiz                                %
%-----------------================+================-----------------%
% Variables for the quiz
var answer1, answer2, answer3, answer4, answer5 : char
var correctanswer : int := 0
var correctcolour : int := 118
var incorrectcolour : int := 4

% Correct screen
procedure correctscreen
    delay (200)
    cls
    delay (200)
    Font.Draw ("Correct!", 140, 185, font10, correctcolour)
    Font.Draw ("Click next to continue", 250, 60, font8, white)
    next
    next2
end correctscreen

% Incorrect screen
procedure incorrectscreen
    delay (200)
    cls
    delay (200)
    Font.Draw ("Incorrect!", 100, 205, font10, incorrectcolour)
    Font.Draw ("Click next to continue", 250, 60, font8, white)
    if page = 1 then
	Font.Draw ("The Answer Was A.", 190, 150, font7, white)
    elsif page = 2 then
	Font.Draw ("The Answer Was A.", 190, 150, font7, white)
    elsif page = 3 then
	Font.Draw ("The Answer Was C.", 190, 150, font7, white)
    elsif page = 4 then
	Font.Draw ("The Answer Was D.", 190, 150, font7, white)
    elsif page = 5 then
	Font.Draw ("The Answer Was C.", 190, 150, font7, white)
    end if
    next
    next2
end incorrectscreen
% Procedure to draw the boxes for multiple choice
procedure Quizbox
    drawfillbox (75, 290, 150, 240, white)
    Font.Draw ("A", 95, 248, font3, red)

    drawfillbox (75, 220, 150, 170, white)
    Font.Draw ("B", 95, 178, font3, red)

    drawfillbox (75, 150, 150, 100, white)
    Font.Draw ("C", 95, 108, font3, red)

    drawfillbox (75, 80, 150, 30, white)
    Font.Draw ("D", 95, 38, font3, red)
end Quizbox

% Page 1 of the quiz
procedure Quiz1
    delay (200)
    cls
    delay (200)
    Font.Draw ("Quiz", 260, 340, font3, white)
    Font.Draw ("Q1. How long does it take for maincrop seed potatoes to mature?", 10, 310, font9, white)
    Font.Draw ("125-140 Days", 175, 256, font7, red) % Correct Answer
    Font.Draw ("100 - 120 Days", 175, 186, font7, red)
    Font.Draw ("60 - 110 Days", 175, 116, font7, red)
    Font.Draw ("150 - 165 Days", 175, 46, font7, red)
    % Boxes
    Quizbox
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 75 and x < 150) and (y < 290 and y > 240) then
		click
		correctanswer := correctanswer + 1
		answer1 := 'A'
		correctscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 170 and y < 220) then
		click
		answer1 := 'B'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 100 and y < 150) then
		click
		answer1 := 'C'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 30 and y < 80) then
		click
		answer1 := 'D'
		incorrectscreen
		exit
	    end if
	end if
    end loop
end Quiz1

% Page 2 of the quiz
procedure Quiz2
    Font.Draw ("Quiz", 260, 340, font3, white)
    Font.Draw ("Q2. How deep should you plant potatoes?", 10, 310, font9, white)
    Font.Draw ("Around 10 cm ", 175, 256, font7, red) % Correct Answer
    Font.Draw ("Around 5 cm", 175, 186, font7, red)
    Font.Draw ("Around 8 cm", 175, 116, font7, red)
    Font.Draw ("Around 12 cm", 175, 46, font7, red)
    Quizbox
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 75 and x < 150) and (y < 290 and y > 240) then
		click
		correctanswer := correctanswer + 1
		answer2 := 'A'
		correctscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 170 and y < 220) then
		click
		answer2 := 'B'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 100 and y < 150) then
		click
		answer2 := 'C'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 30 and y < 80) then
		click
		answer2 := 'D'
		incorrectscreen
		exit
	    end if
	end if
    end loop
end Quiz2

% Page 3 of the quiz
procedure Quiz3
    Font.Draw ("Quiz", 260, 340, font3, white)
    Font.Draw ("Q3. How often should you water potatoes in the summer?", 10, 310, font9, white)
    Font.Draw ("Almost everyday", 175, 256, font7, red)
    Font.Draw ("Around twice a week", 175, 186, font7, red)
    Font.Draw ("Around once a week", 175, 116, font7, red) % Correct Answer
    Font.Draw ("Around every 48 hours", 175, 46, font7, red)
    Quizbox
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 75 and x < 150) and (y < 290 and y > 240) then
		click
		answer3 := 'A'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 170 and y < 220) then
		click
		answer3 := 'B'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 100 and y < 150) then
		click
		correctanswer := correctanswer + 1
		answer3 := 'C'
		correctscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 30 and y < 80) then
		click
		answer3 := 'D'
		incorrectscreen
		exit
	    end if
	end if
    end loop
end Quiz3

% Page 4 of the quiz
procedure Quiz4
    Font.Draw ("Quiz", 260, 340, font3, white)
    Font.Draw ("Q4. How far apart should potatoes be planted?", 10, 310, font9, white)
    Font.Draw ("10 cm", 175, 256, font7, red)
    Font.Draw ("23 cm", 175, 186, font7, red)
    Font.Draw ("18 cm", 175, 116, font7, red)
    Font.Draw ("30 cm", 175, 46, font7, red) % Correct Answer
    Quizbox
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 75 and x < 150) and (y < 290 and y > 240) then
		click
		answer4 := 'A'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 170 and y < 220) then
		click
		answer4 := 'B'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 100 and y < 150) then
		click
		answer4 := 'C'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 30 and y < 80) then
		click
		correctanswer := correctanswer + 1
		answer4 := 'D'
		correctscreen
		exit
	    end if
	end if
    end loop
end Quiz4

% Page 5 of the quiz
procedure Quiz5
    Font.Draw ("Quiz", 260, 340, font3, white)
    Font.Draw ("Q5. How much water should potatoes get each week? ", 10, 310, font9, white)
    Font.Draw ("About 2 cm ", 175, 256, font7, red)
    Font.Draw ("About 4 cm", 175, 186, font7, red)
    Font.Draw ("About 5 cm", 175, 116, font7, red) % Correct Answer
    Font.Draw ("About 7 cm", 175, 46, font7, red)
    Quizbox
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 75 and x < 150) and (y < 290 and y > 240) then
		click
		answer5 := 'A'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 170 and y < 220) then
		click
		answer5 := 'B'
		incorrectscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 100 and y < 150) then
		click
		correctanswer := correctanswer + 1
		answer5 := 'C'
		correctscreen
		exit
	    elsif (x > 75 and x < 150) and (y > 30 and y < 80) then
		click
		answer5 := 'D'
		incorrectscreen
		exit
	    end if
	end if
    end loop
end Quiz5

% Last page of quiz
procedure Quiz6
    Font.Draw ("Quiz Results:", 10, 250, font10, white)
    if correctanswer = 0 then
	Font.Draw ("You got 0 questions correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("Did you even read the lesson?", 200, 130, font8, white)
    elsif correctanswer = 1 then
	Font.Draw ("You got 1 question correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("You should definitely review the lesson.", 170, 130, font8, white)
    elsif correctanswer = 2 then
	Font.Draw ("You got 2 questions correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("You should review the lesson more.", 170, 130, font8, white)
    elsif correctanswer = 3 then
	Font.Draw ("You got 3 questions correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("You should review the lesson a bit more.", 160, 130, font8, white)
    elsif correctanswer = 4 then
	Font.Draw ("You got 4 questions correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("You should review the lesson a bit more.", 160, 130, font8, white)
    elsif correctanswer = 5 then
	Font.Draw ("You got all questions correct.", 40, 180, font4, incorrectcolour)
	Font.Draw ("Congratulations! You know how to grow potatoes!", 130, 130, font8, white)
    else
	Font.Draw ("Error", 10, 150, font10, incorrectcolour)
    end if
end Quiz6
% Actual procedure for the quiz
procedure Quiz
    loop
	case page of
	    label 1 : % First Page
		click
		Quiz1
	    label 2 : % Second Page
		click
		Quiz2
	    label 3 : % Third Page
		click
		Quiz3
	    label 4 : % Fourth Page
		click
		Quiz4
	    label 5 : % Fifth Page
		click
		Quiz5
	    label 6 : % Sixth Page
		click
		Quiz6
		menu
		menu2
		exit
	end case
    end loop
end Quiz

%-----------------================+================-----------------%
%                             Animation                             %
%-----------------================+================-----------------%
% Declaration of variables
% Colour variables
var potato : int := 138 % Brown
var water : int := 77 % Blue
var dirt : int := 137 % Dark brown
var leaves : int := 119 % Green
var shovel : int := 24
var handle : int := 66
% Delay variables
var Delay : int := 50
var Delay2 : int := 3000 % For text

% Procedure
% First part of the animation
% Potato being planted
procedure Animation1
    delay (200)
    cls
    delay (200)
    x := maxx div 2
    y := 180
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Plant the potato...", 50, 200, font9, white)
	drawfilloval (x, y, 20, 30, potato)
	y := y - 3
	drawfillbox (0, 115, 640, 0, dirt)
	delay (Delay)
	cls
	exit when y <= 80
    end loop
end Animation1
% Watering the potato
procedure Animation2
    var x1 : int := (maxx div 2) - 1
    var x2 : int := (maxx div 2) + 1
    var y1 : int := 300
    var y2 : int := 275
    loop
	y1 := y1 - 5
	y2 := y2 - 5
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Water the potato...", 50, 200, font9, white)
	% Water
	drawfillbox (x1, y1, x2, y2, water)
	drawfillbox (x1 + 10, y1, x2 + 10, y2, water)
	drawfillbox (x1 - 10, y1, x2 - 10, y2, water)
	drawfillbox (x1 + 20, y1, x2 + 20, y2, water)
	drawfillbox (x1 - 20, y1, x2 - 20, y2, water)
	% Ground
	drawfillbox (0, 115, 640, 0, dirt)
	delay (Delay)
	cls
	exit when y1 <= 115
    end loop
end Animation2
% Potato growing
procedure Animation3
    var x1 : int := (maxx div 2) - 1
    var x2 : int := (maxx div 2) + 1
    var y3 : int := 115
    var y4 : int := 115
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("The potato grows...", 50, 200, font9, white)
	drawfillbox (x1, y3, x2, y4, leaves)
	y4 := y4 + 1
	drawfillbox (0, 115, 640, 0, dirt)
	delay (Delay)
	exit when y4 >= 150
    end loop
end Animation3
% Skipping Time
procedure Animation4
    delay (500)
    cls
    Font.Draw ("Animation", 210, 340, font3, white)
    % WATERING THE POTATO
    var x1 : int := (maxx div 2) - 1
    var x2 : int := (maxx div 2) + 1
    var y1 : int := 300
    var y2 : int := 275
    var y3 : int := 115
    var y4 : int := 150

    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Water once week...", 50, 200, font9, white)
	% Water
	drawfillbox (x1, y1, x2, y2, water)
	drawfillbox (x1 + 10, y1, x2 + 10, y2, water)
	drawfillbox (x1 - 10, y1, x2 - 10, y2, water)
	drawfillbox (x1 + 20, y1, x2 + 20, y2, water)
	drawfillbox (x1 - 20, y1, x2 - 20, y2, water)
	% Ground
	drawfillbox (0, 115, 640, 0, dirt)
	drawfillbox (x1, y3, x2, y4, leaves)
	y1 := y1 - 5
	y2 := y2 - 5
	exit when y1 <= 115
	delay (Delay)
	cls
    end loop
    % Potato Growing a bit more
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("The potato grows...", 50, 200, font9, white)
	drawfillbox (0, 115, 640, 0, dirt)
	drawfillbox (x1, y3, x2, y4, leaves)
	y4 := y4 + 1
	exit when y4 = 200
	delay (Delay)
	cls
    end loop
    % WATER AGAIN
    x1 := (maxx div 2) - 1
    x2 := (maxx div 2) + 1
    y1 := 300
    y2 := 275
    y3 := 115
    y4 := 200
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Repeat...", 50, 200, font9, white)
	% Water
	drawfillbox (x1, y1, x2, y2, water)
	drawfillbox (x1 + 10, y1, x2 + 10, y2, water)
	drawfillbox (x1 - 10, y1, x2 - 10, y2, water)
	drawfillbox (x1 + 20, y1, x2 + 20, y2, water)
	drawfillbox (x1 - 20, y1, x2 - 20, y2, water)
	% Ground
	drawfillbox (0, 115, 640, 0, dirt)
	drawfillbox (x1, y3, x2, y4, leaves)
	y1 := y1 - 5
	y2 := y2 - 5
	exit when y1 <= 115
	delay (Delay)
	cls
    end loop
    % Skip a few weeks
    delay (500)
    cls
    Font.Draw ("Animation", 210, 340, font3, white)
    Font.Draw ("Around 10 Weeks Later...", 30, 200, font3, white)
    delay (Delay2)
    cls
end Animation4
% Digging the potato out
% Initial location of shovel
procedure digstart
    var x1 : int := (maxx div 2) - 5
    var x2 : int := (maxx div 2) + 5
    var x3 : int := maxx div 2
    var x4 : int := (maxx div 2) - 3
    var x5 : int := (maxx div 2) + 3
    var y3 : int := 115
    var y4 : int := 200
    var y5 : int := 180
    var y6 : int := 150
    var y7 : int := 250
    var y8 : int := 325
    loop
	cls
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Dig out the potato...", 50, 200, font9, white)
	drawfillbox (0, 115, 640, 0, dirt)
	% Plant
	drawfillbox (x1, y3, x2, y4, leaves)
	drawfilloval (x3, y5, 15, 40, leaves)
	drawfilloval (x3, y6, 75, 10, leaves)
	% Shovel
	drawfillbox (x4, y7, x5, y8, handle)
	Draw.FillArc (x3, y7, 10, 30, 180, 360, shovel)
	y7 := y7 - 5
	y8 := y8 - 5
	exit when y7 <= 145
	delay (Delay)
	cls
    end loop
end digstart
% Shovel goes up
procedure digup
    var x1 : int := (maxx div 2) - 5
    var x2 : int := (maxx div 2) + 5
    var x3 : int := maxx div 2
    var x4 : int := (maxx div 2) - 3
    var x5 : int := (maxx div 2) + 3
    var y3 : int := 115
    var y4 : int := 200
    var y5 : int := 180
    var y6 : int := 150
    var y9 : int := 145
    var y10 : int := 220
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Dig out the potato...", 50, 200, font9, white)
	drawfillbox (0, 115, 640, 0, dirt)
	% Plant
	drawfillbox (x1, y3, x2, y4, leaves)
	drawfilloval (x3, y5, 15, 40, leaves)
	drawfilloval (x3, y6, 75, 10, leaves)
	% Shovel
	drawfillbox (x4, y9, x5, y10, handle)
	Draw.FillArc (x3, y9, 10, 30, 180, 360, shovel)
	y9 := y9 + 5
	y10 := y10 + 5
	exit when y10 >= 300
	delay (Delay)
	cls

    end loop
end digup
procedure digdown
    cls
    var x1 : int := (maxx div 2) - 5
    var x2 : int := (maxx div 2) + 5
    var x3 : int := maxx div 2
    var x4 : int := (maxx div 2) - 3
    var x5 : int := (maxx div 2) + 3
    var y3 : int := 115
    var y4 : int := 200
    var y5 : int := 180
    var y6 : int := 150
    var y11 : int := 225
    var y12 : int := 300
    loop
	Font.Draw ("Animation", 210, 340, font3, white)
	Font.Draw ("Dig out the potato...", 50, 200, font9, white)
	drawfillbox (0, 115, 640, 0, dirt)
	% Plant
	drawfillbox (x1, y3, x2, y4, leaves)
	drawfilloval (x3, y5, 15, 40, leaves)
	drawfilloval (x3, y6, 75, 10, leaves)
	% Shovel
	y11 := y11 - 5
	y12 := y12 - 5
	drawfillbox (x4, y11, x5, y12, handle)
	Draw.FillArc (x3, y11, 10, 30, 180, 360, shovel)
	exit when y11 <= 145
	delay (Delay)
	cls
    end loop
end digdown
% Actual procedure for the digging
procedure Animation5
    digstart
    digup
    digdown
    digup
    digdown
    digup
end Animation5
% Ending screen
procedure Animation6
    var x := maxx div 2
    var y := 150
    delay (200)
    cls
    delay (200)
    Font.Draw ("Animation", 210, 340, font3, white)
    Font.Draw ("Yay! You Have Harvested Potatoes!", 15, 250, font6, white)
    drawfilloval (x, y, 30, 45, potato)
    drawfilloval (x + 100, y, 30, 45, potato)
    drawfilloval (x - 100, y, 30, 45, potato)
    menu
    menu2
end Animation6
% Actual procedure of the animation
procedure Animation
    Animation1
    Animation2
    Animation3
    Animation4
    Animation5
    Animation6
end Animation
%-----------------================+================-----------------%
%                             Exit Screen                           %
%-----------------================+================-----------------%
% Procedure
procedure Exit
    delay (200)
    cls
    delay (200)
    Font.Draw ("Thanks For Playing!", 50, 200, font1, white)
    delay (1000)
    Window.Hide (defWinID)
end Exit

%-----------------================+================-----------------%
%                            Title Screen                           %
%-----------------================+================-----------------%
% Welcome screen procedure
procedure welcome
    Font.Draw ("Welcome!", 200, 285, font1, white)
    delay (100)
    Font.Draw ("How to Grow Potatoes", 150, 245, font2, white)
    delay (100)
    Font.Draw ("By: Alan Bu", 250, 210, font7, white)
    Font.Draw ("ICS2O1-21", 280, 180, font9, white)
    Font.Draw ("Mr. Lee", 290, 155, font9, white)
    delay (100)
    Font.Draw ("Click next to continue", 250, 60, font8, white)
end welcome
% Screen
procedure title
    colorback (background)
    cls
    welcome
    next
    loop
	mousewhere (x, y, b)
	if b = 1 then
	    if (x > 500 and x < 600) and (y < 90 and y > 40) then
		click
		exit
	    end if
	end if
    end loop
end title

%-----------------================+================-----------------%
%                            Main program                           %
%-----------------================+================-----------------%

title
Menuscreen
loop
    Mouse.Where (x, y, b)
    if b = 1 then
	if (x > 340 and x < 560) and (y < 140 and y > 40) then         % EXIT SCREEN
	    click
	    Exit
	elsif (x > 70 and x < 290) and (y < 275 and y > 175) then      % Lesson
	    page := 1
	    click
	    Lesson
	elsif (x > 340 and x < 560) and (y < 275 and y > 175) then     % Animation
	    click
	    Animation
	elsif (x < 290 and x > 70) and (y > 40 and y < 140) then       % Quiz
	    cls
	    page := 1
	    click
	    Quiz
	end if
    end if
end loop

%-----------------================+================-----------------%
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~  THE END  ~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
%-----------------================+================-----------------%
% Yay!

