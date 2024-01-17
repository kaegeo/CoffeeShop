USE [Master]

GO

CREATE DATABASE [BFGPDatabase]

GO

USE [BFGPDatabase]

GO

CREATE TABLE Menu (
	MenuID int not null,
	MenuName varchar (40) not null,
	MenuPrice decimal (10,2) not null,
	RecipeID varchar (10) not null,
	CONSTRAINT PK_Menu PRIMARY KEY (MenuID)
)

GO

CREATE TABLE Recipes (
	RecipeID int not null,
	MenuID int not null,
	RecipeDirections varchar(MAX) null,
	NumberOfServings int not null,
	CONSTRAINT PK_Recipes PRIMARY KEY (RecipeID),
	CONSTRAINT FK_Recipes_Menu FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
)

GO

CREATE TABLE Inventory (
	InventoryID int not null,
	ItemName varchar (40) not null,
	InvQuantity decimal (10,2) not null,
	InvUnitOFMeasure varchar (4) not null,
	InvCostPerUnit decimal (10,2) not null,
	CONSTRAINT PK_Inventory PRIMARY KEY (InventoryID)
)

GO

CREATE TABLE IngredientsToRecipe (
	RecipeID int not null,
	InventoryID int not null,
	IngAmount decimal (10,2) not null,
	IngUnitOfMeasure varchar (4) not null,
	CONSTRAINT PK_IngredientsToRecipe PRIMARY KEY (RecipeID, InventoryID),
	CONSTRAINT FK_IngredientsToRecipe_Recipes FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
	CONSTRAINT FK_IngredientsToRecipe_Inventory FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
)

GO
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  DateOfBirth DATE NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(20) NOT NULL,
  Department VARCHAR(100) NOT NULL,
  [Pay] DECIMAL (10, 2) NOT NULL
);
GO
CREATE TABLE WorkSchedule (
  ScheduleID INT PRIMARY KEY NOT NULL,
  EmployeeID INT NOT NULL,
  ScheduleDate DATE,
  StartTime INT,
  EndTime INT,
  ShiftType VARCHAR(3),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
);
GO

INSERT INTO Menu VALUES
(10000, 'Cappuccino', 3.45, 20000),
(10001, 'Caffe Mocha', 4.15, 20001),
(10002, 'Coffee', 2.25, 20002),
(10003, 'Chocolate Croissant', 3.75, 20003),
(10004, 'Chai Tea Latte', 3.95, 20004),
(10005, 'Lemon Loaf Cake', 3.75, 20005)

GO

INSERT INTO Recipes VALUES
(20000, 10000, 'Warm the espresso machine. Put the coffee in the filter basket of the portafilter, gently but firmly tamp it down with a tamper, and secure the portafilter in the brew head. Place a 5- or 6-ounce cup directly under the brew head.
Brew just long enough to yield 1 to 1 1/2 ounces (30 to 44 ml) of espresso. Turn your machine off just as it finishes pouring the last of the pale-colored crema and before the espresso becomes watery, which you’ll learn with practice. The exact time will depend on your machine.
Turn on the steamer and let it warm up. Pour the milk into a stainless steel pitcher. Submerge the tip of the steam wand at least half an inch below the milk surface and turn on the steam switch. As the foam rises, gradually lower the pitcher so the tip of the wand remains just below the milk surface. As the milk begins to heat up, tilt the pitcher slightly to swirl the milk and continue to steam until the side of the pitcher becomes almost too hot to hold. Turn off the steam while still holding the tip of the wand under the milk surface.
Very slowly pour the milk into the cappuccino in one of two ways:
For a smooth cappuccino in which both the warmed and foamed milk on top is evenly integrated throughout the beverage, gently pour the milk over the espresso in a thin, steady stream.', 1),
(20001, 10001, 'Place the filter in the coffeemaker’s basket.
Add your ground coffee beans and then pour in some of the hot water.  Use just enough to soak the grounds without pouring through.
Wait 45-90 seconds, permitting the grinds to settle, and then simply operate the automatic coffeemaker as you normally would using 36 ounces of water.', 1),
(20002, 10002, 'Place the filter in the coffeemaker’s basket.
Add your ground coffee beans and then pour in some of the hot water.  Use just enough to soak the grounds without pouring through.
Wait 45-90 seconds, permitting the grinds to settle, and then simply operate the automatic coffeemaker as you normally would using 36 ounces of water. Stir cocoa, sugar, and milk into the finished coffee.', 2),
(20003, 10003, 'Make the dough: Cut the butter in four 1-Tablespoon slices and place in the bowl of an electric stand mixer fitted with the dough hook attachment (or you can use a handheld mixer or no mixer, but a stand mixer is ideal). Add the flour, sugar, salt, and yeast. Turn the mixer on low-medium speed to gently combine the ingredients for 1 minute. With the mixer running, slowly pour in the milk. Once all of the milk is added, turn the mixer up to medium speed and beat the dough for at least 5 full minutes. (If you don’t have a mixer, knead by hand for 5 minutes.) The dough will be soft. It will (mostly) pull away from the sides of the bowl and if you poke it with your finger, it will bounce back. If after 5 minutes the dough is too sticky, keep the mixer running until it pulls away from the sides of the bowl.
Remove dough from the bowl and, with floured hands, work it into a ball. Place the dough on a lightly floured silicone baking mat lined, lightly floured parchment paper lined, or lightly floured baking sheet. (I recommend a silicone baking mat because you can roll the dough out in the next step directly on top and it won’t slide all over the counter.) Gently flatten the dough out, and cover with plastic wrap or aluminum foil. Place the entire baking sheet in the refrigerator and allow the covered dough to rest in the refrigerator for 30 minutes.
Shape the dough: Remove the dough from the refrigerator. I like to keep the dough on the silicone baking mat when I’m rolling it in this step because the mat is nonstick and it’s a handy guide for the exact measurement. Begin flattening out the dough with your hands. You’re rolling it out into a rectangle in this step, so shaping it with your hands first helps the stretchy dough. Roll it into a 14×10-inch rectangle. The dough isn’t extremely cold after only 30 minutes in the refrigerator, so it will feel more like soft play-doh. Be precise with the measurement. The dough will want to be oval shaped, but keep working the edges with your hands and rolling pin until you have the correct size rectangle.
Long rest: Place the rolled out dough back onto the baking sheet (this is why I prefer a silicone baking mat or parchment because you can easily transfer the dough). Cover the rolled out dough with plastic wrap or aluminum foil, place the entire baking sheet in the refrigerator and allow the covered dough to rest in the refrigerator for 4 hours or overnight. (Up to 24 hours is ok.)
Butter layer (begin this 35 minutes before the next step so the butter can chill for 30 minutes): In a large bowl using a hand-held mixer or stand mixer fitted with a paddle or whisk attachment, beat the butter and flour together until smooth and combined. Transfer the mixture to a silicone baking mat lined or parchment paper lined baking sheet. (Silicone baking mat is preferred because you can easily peel the butter off in the next step.) Using a spoon or small spatula, smooth out into a 7×10-inch rectangle. Be as precise as you can with this measurement. Place the entire baking sheet in the refrigerator and chill the butter layer for 30 minutes. (No need to cover it for only 30 minutes.) You want the butter layer firm, but still pliable. If it gets too firm, let it sit out on the counter for a few minutes to gently soften. The more firm the butter layer is the more difficult it will be to laminate the dough in the next step.
Laminate the dough: In this next step, you will be rolling out the dough into a large rectangle. Do this on a lightly floured counter instead of rolling out on your silicone baking mat. The counter is typically a little cooler (great for keeping the dough cold) and the silicone baking mat is smaller than the measurement you need. Remove both the dough and butter layers from the refrigerator. Place the butter layer in the center of the dough and fold each end of the dough over it. If the butter wasn’t an exact 7×10-inch rectangle, use a pizza cutter or sharp knife to even out the edges. Seal the dough edges over the butter layer as best you can with your fingers. On a lightly floured counter, roll the dough into a 10×20-inch rectangle. It’s best to roll back and forth with the shorter end of the dough facing you. Use your fingers if you need to. The dough is very cold, so it will take a lot of arm muscle to roll. Again, the dough will want to be oval shaped, but keep working it with your hands and rolling pin until you have the correct size rectangle. Fold the dough lengthwise into thirds as if you were folding a letter. This was the 1st turn.
If the dough is now too warm to work with, place folded dough on the baking sheet, cover with plastic wrap or aluminum foil, and refrigerate for 30 minutes before the 2nd turn. I usually don’t have to.
2nd turn: Turn the dough so the short end is facing you. Roll the dough out once again into a 10×20-inch rectangle, then fold the dough lengthwise into thirds as if you were folding a letter. The dough must be refrigerated between the 2nd and 3rd turn because it has been worked with a lot by this point. Place the folded dough on the baking sheet, cover with plastic wrap or aluminum foil, and refrigerate for 30 minutes before the 3rd turn.
3rd turn: Roll the dough out once again into a 10×20-inch rectangle. Fold the dough lengthwise into thirds as if you were folding a letter.
Long rest: Place the folded dough on the lined baking sheet, cover with plastic wrap or aluminum foil, and refrigerate for 4 hours or overnight. (Up to 24 hours is ok.)
At the end of the next step, you’ll need 2 baking sheets lined with silicone baking mats or parchment paper. The dough is currently on a lined baking sheet in the refrigerator, so you already have 1 prepared!
Shape the croissants: Remove the dough from the refrigerator. On a lightly floured counter, roll the dough out into an 8×20-inch rectangle. Use your fingers if you need to. Once again, the dough is very cold, so it will take a lot of arm muscle to roll. The dough will want to be oval shaped, but keep working it with your hands and rolling pin until you have the correct size rectangle. Using a pizza cutter or sharp knife, slice the dough in half vertically. Each skinny rectangle will be 4 inches wide. Then cut 3 even slices horizontally, yielding 8 4×5-inch rectangles. See photo above for a visual. Cut each rectangle in half lengthwise so you have 16 2×5-inch rectangles. Work with one rectangle at a time. Using your fingers or a rolling pin, stretch it to be about 8 inches long. Do this gently as you do not want to flatten the layers. Place a few small pieces of chocolate in a single layer at one end and tightly roll the dough up around the chocolate. Make sure the end is on the bottom. Repeat with remaining dough, placing the shaped croissants on 2 lined baking sheets, 8 per sheet. Loosely cover with plastic wrap or aluminum foil and allow to rest at room temperature (no warmer! I suggest just keeping on the counter) for 1 hour, then place in the refrigerator to rest for 1 hour or up to 12 hours. (Or freeze, see freezing instructions. I prefer the shaped croissants to be cold going into the oven.
Preheat oven to 400°F (204°C).
Egg wash: Whisk the egg wash ingredients together. Remove the croissants from the refrigerator. Brush each lightly with egg wash.
Bake the croissants: Bake until croissants are golden brown, about 20 minutes. Rotate the pans halfway through baking. If croissants show signs of darkening too quickly, reduce the oven to 375°F (190°C).
Remove chocolate croissants from the oven and place on a wire rack to cool for a few minutes before serving. They will slightly deflate as they cool. If desired, dust with confectioners’ sugar before serving.
Croissants taste best the same day they’re baked. Cover any leftover croissants and store at room temperature for a few days or in the refrigerator for up to 1 week. You can also freeze for up to 3 months, then thaw on the counter or overnight in the refrigerator. Warm up to your liking.', 16),
(20004, 10004, 'Bring 1 cup of water to a boil.
Add the chai tea bags, cinnamon, nutmeg and maple syrup. Cover and let steep for 10 minutes.', 1),
(20005, 10005, 'Heat oven to 400 degrees Fahrenheit. Line 10 muffin cups with paper liners.Whisk the flour, sugar, baking powder, and salt in a large bowl.Add oil to a measuring jug that holds at least 1 cup. Add the egg then fill the jug to the 1-cup line with milk (1/3 to 1/2 cup milk). Add vanilla and whisk to combine.Add milk mixture to the bowl with dry ingredients then use a fork to combine. Do not over mix. (The muffin batter will be quite thick — see note below for more details). Fold in the blueberries.Divide the batter between muffin cups. (If making big-topped muffins, the batter will come to the tops of the paper liners). Sprinkle a little sugar on top of each muffin.Bake muffins 15 to 20 minutes or until tops are no longer wet and a toothpick inserted into the middle of a muffin comes out with crumbs, not wet batter. Transfer to a cooling rack.', 10)

GO

INSERT INTO Inventory VALUES
(30000, 'Ground Coffee', 100, 'OZ', .60),
(30001, 'Whole Milk', 640, 'OZ', .02),
(30002, 'Unsweetened Cocoa Powder', 80, 'OZ', .43),
(30003, 'Granulated White Sugar', 112, 'OZ', .31),
(30004, 'Unsalted Butter', 160, 'OZ', .31),
(30005, 'All-Purpose Flour', 256, 'OZ', .16),
(30006, 'Salt', 52, 'OZ', .77),
(30007, 'Dry Yeast', 18, 'OZ', .51),
(30008, 'Semi-Sweet Chocolate Chips', 48, 'OZ', .79),
(30009, 'Large Eggs', 120, 'CT', .35),
(30010, 'Chai Tea Bags', 100, 'CT', .20),
(30011, 'Ground Cinnamon', 20, 'OZ', .73),
(30012, 'Ground Nutmeg', 20, 'OZ', .88),
(30013, 'Honey', 80, 'OZ', .29),
(30014, 'Baking Powder', 70, 'OZ', .43),
(30015, 'Vegetable Oil', 256, 'OZ', .09),
(30016, 'Vanilla Extract', 16, 'OZ', 1.75),
(30017, 'Frozen Blueberries', 48, 'OZ', 3.00)

GO

INSERT INTO IngredientsToRecipe VALUES
(20000, 30000, .5, 'OZ'),
(20000, 30001, 2, 'OZ'),
(20001, 30000, 1, 'OZ'),
(20001, 30001, 1, 'OZ'),
(20001, 30002, .5, 'OZ'),
(20001, 30003, .5, 'OZ'),
(20002, 30000, 2.25, 'OZ'),
(20003, 30001, 13, 'OZ'),
(20003, 30003, 2, 'OZ'),
(20003, 30004, 14, 'OZ'),
(20003, 30005, 33, 'OZ'),
(20003, 30006, .33, 'OZ'),
(20003, 30007, .5, 'OZ'),
(20003, 30008, 4, 'OZ'),
(20003, 30009, 1, 'CT'),
(20004, 30001, 8, 'OZ'),
(20004, 30010, 2, 'CT'),
(20004, 30011, .05, 'OZ'),
(20004, 30012, .05, 'OZ'),
(20004, 30013, 1, 'OZ'),
(20005, 30001, 4, 'OZ'),
(20005, 30003, 6, 'OZ'),
(20005, 30005, 12, 'OZ'),
(20005, 30006, .04, 'OZ'),
(20005, 30009, 1, 'CT'),
(20005, 30014, .33, 'OZ'),
(20005, 30015, 2.64, 'OZ'),
(20005, 30016, .25, 'OZ'),
(20005, 30017, 8, 'OZ')


INSERT INTO Employees (EmployeeID, FirstName, LastName, DateOfBirth, Email, Phone, Department, [Pay])
VALUES (20, 'Ethan', 'Anderson', '1990-02-12', 'EthanAnderson37@gmail.com', '8642019375', 'Management', '30'),
(1, 'Ava', 'Mitchell', '2003-07-02', 'AvaMitchell35@yahoo.com', '8642035350', 'Shift Supervisor', '18.75'),
(2, 'Liam', 'Thompson', ' 2000-04-30', 'LiamThompson38@gmail.com', '8642038380', 'Shift Supervisor', '18'),
(3, 'Isabella', 'Rodriguez', '2002-02-12', 'IsabellaRodriguez37@gmail.com', '8642037370', 'Shift Supervisor', '18'),
(4, 'Noah', 'Johnson', '2004-09-27', 'NoahJohnson27@gmail.com', '8642027270', 'Shift Supervisor', '18'), 
(5, 'Aria', 'Patel', '1989-08-07', 'AriaPatel25@gmail.com', '8642025250', 'Baker', '15'), 
(6, 'Sebastian', 'Wright', '2005-03-18', 'SebastianWright41@gmail.com', '8642041410', 'Baker', '15'),
(7, 'Aurora', 'Ramirez', '1999-11-23', 'AuroraRamirez30@gmail.com', '8642030300', 'Baker', '15.3'),
(8, 'Mateo', 'Gonzalez', '2003-09-06', 'MateoGonzalez32@example.com', '8642032320', 'Bookkeeper', '20'),
(9, 'Esmeralda ', 'Silva', '1998-12-11', 'EsmeraldaSilva46@gmail.com', '8642046460', 'Trainee', '15'),
(10, 'Kailynn', 'Liebau', '2004-07-22', 'Kailynn@gmail.com', '8642046460', 'Barista', '15'),
(11, 'Brett', 'Fowler', '2000-01-01', 'Brett@yahoo.com', '8642026260', 'Barista', '15'),
(12, 'Nathaniel', 'Bagwell', '2000-01-01', 'Nathaniel@yahoo.com', '8642042420', 'Barista', '15'),
(13, 'Nathan', ' Richardson', '2000-01-01', 'Nathan@gmail.com', '8642031310', 'Barista', '15'),
(14, 'Benjamin', 'Wilson', '2001-10-15', 'BenjaminWilson46@gmail.com', '8642036360', 'Barista', '15'),
(15, 'Maya', 'Lopez', '1999-06-29', 'MayaLopez26@gmail.com', '8642029290', 'Barista', '15'),
(16, 'Elijah', 'Smith', '2002-01-08', 'ElijahSmith42@yahoo.com', '8642042420', 'Barista', '15'),
(17, 'Suri', 'Davis', '2001-11-09', 'SuriDavis31@gmail.com', '8642027270', 'Barista', '15'),
(18, 'Lucas', 'Brown', '1981-03-19', 'LucasBrown36@gmail.com', '8645965853', 'Barista', '15'),
(19, 'Zahara', 'Khan', '2004-05-20', 'ZaharaKhan42@gmail.com', '8642043430', 'Barista', '15')
GO


--  0 - 4AM 4 TO 8AM 8AM T 16AM 16TO 24A
INSERT INTO WorkSchedule (ScheduleID, EmployeeID, ScheduleDate, StartTime, EndTime, ShiftType)
VALUES
	(0001, 20, '2023-07-17', 9, 16, 'MN'),
	(0002, 20, '2023-07-18', 10, 16, 'AFT'),
	(0003, 20, '2023-07-19', 10, 17, 'AFT'),
	(0004, 20, '2023-07-20', 8, 12, 'MN'),
	(0005, 20, '2023-07-21', 11, 17, 'AFT'),
	
	--Bookkeeper
	(0006, 9, '2023-07-17', 10, 17, 'AFT'),
	(0007, 9, '2023-07-20', 10, 17, 'AFT'),
	
	--Monday +baker, shift lead	
	(0011, 1, '2023-07-17', 0, 4, 'EMN'),
	(0012, 5, '2023-07-17', 0, 4, 'EMN'),
	(0013, 8, '2023-07-17', 0, 4, 'EMN'),

	(0014, 12, '2023-07-17', 4, 8, 'MN'),
	(0015, 2, '2023-07-17', 4, 8, 'MN'),
	(0016, 10, '2023-07-17', 4, 8, 'MN'),
	
	(0017, 11, '2023-07-17', 8, 16, 'AFT'),
	(0018, 3, '2023-07-17', 8, 16, 'AFT'),
	(0019, 13, '2023-07-17', 8, 16, 'AFT'),
	
	(0020, 14, '2023-07-17', 16, 24, 'NGT'),
	(0021, 4, '2023-07-17', 16, 24, 'NGT'),
	(0022, 15, '2023-07-17', 16, 24, 'NGT'),
	--Tuesday +baker
	(0023, 2, '2023-07-18', 0, 4, 'EMN'),
	(0024, 16, '2023-07-18', 0, 4, 'EMN'),
	(0025, 17, '2023-07-18', 0, 4, 'EMN'),
	
	(0026, 1, '2023-07-18', 4, 8, 'MN'),
	(0027, 18, '2023-07-18', 4, 8, 'MN'),
	(0028, 19, '2023-07-18', 4, 8, 'MN'),
	
	(0029, 20, '2023-07-18', 8, 16, 'AFT'),
	(0030, 5, '2023-07-18', 8, 16, 'AFT'),
	(0031, 6, '2023-07-18', 8, 16, 'AFT'),
	
	(0032, 7, '2023-07-18', 16, 24, 'NGT'),
	(0033, 8, '2023-07-18', 16, 24, 'NGT'),
	(0034, 15, '2023-07-18', 16, 24, 'NGT'),
	--Wed 
	(0035, 1, '2023-07-19', 0, 4, 'EMN'),
	(0036, 5, '2023-07-19', 0, 4, 'EMN'),
	(0037, 10, '2023-07-19', 0, 4, 'EMN'),
	
	(0038, 11, '2023-07-19', 4, 8, 'MN'),
	(0039, 12, '2023-07-19', 4, 8, 'MN'),
	(0040, 13, '2023-07-19', 4, 8, 'MN'),
	
	(0041, 4, '2023-07-19', 8, 16, 'AFT'),
	(0042, 7, '2023-07-19', 8, 16, 'AFT'),
	(0043, 14, '2023-07-19', 8, 16, 'AFT'),

	(0044, 2, '2023-07-19', 16, 24, 'NGT'),
	(0045, 15, '2023-07-19', 16, 24, 'NGT'),
	(0046, 16, '2023-07-19', 16, 24, 'NGT'),
	--thrus 
	(0047, 17, '2023-07-20', 0, 4, 'EMN'),
	(0048, 5, '2023-07-20', 0, 4, 'EMN'),
	(0049, 18, '2023-07-20', 0, 4, 'EMN'),

	(0050, 19, '2023-07-20', 4, 8, 'MN'),
	(0051, 1, '2023-07-20', 4, 8, 'MN'),
	(0052, 20, '2023-07-20', 4, 8, 'MN'),

	(0053, 5, '2023-07-20', 8, 16, 'AFT'),
	(0054, 4, '2023-07-20', 8, 16, 'AFT'),
	(0055, 6, '2023-07-20', 8, 16, 'AFT'),

	(0056, 7, '2023-07-20', 16, 24, 'NGT'),
	(0057, 6, '2023-07-20', 16, 24, 'NGT'),
	(0058, 8, '2023-07-20', 16, 24, 'NGT'),
	--fri 
	(0059, 5, '2023-07-21', 0, 4, 'EMN'),
	(0060, 1, '2023-07-21', 0, 4, 'EMN'),
	(0061, 10, '2023-07-21', 0, 4, 'EMN'),

	(0062, 11, '2023-07-21', 4, 8, 'MN'),
	(0063, 2, '2023-07-21', 4, 8, 'MN'),
	(0064, 5, '2023-07-21', 4, 8, 'MN'),

	(0065, 12, '2023-07-21', 8, 16, 'AFT'),
	(0066, 13, '2023-07-21', 8, 16, 'AFT'),
	(0067, 14, '2023-07-21', 8, 16, 'AFT'),

	(0068, 4, '2023-07-21', 16, 24, 'NGT'),
	(0069, 15, '2023-07-21', 16, 24, 'NGT'),
	(0070, 16, '2023-07-21', 16, 24, 'NGT'),
	--sat 
	(0071, 5, '2023-07-22', 0, 4, 'EMN'),
	(0072, 17, '2023-07-22', 0, 4, 'EMN'),
	(0073, 18, '2023-07-22', 0, 4, 'EMN'),

	(0074, 19, '2023-07-22', 4, 8, 'MN'),
	(0075, 2, '2023-07-22', 4, 8, 'MN'),
	(0076, 20, '2023-07-22', 4, 8, 'MN'),

	(0077, 7, '2023-07-22', 8, 16, 'AFT'),
	(0078, 5, '2023-07-22', 8, 16, 'AFT'),
	(0079, 4, '2023-07-22', 8, 16, 'AFT'),

	(0080, 11, '2023-07-22', 16, 24, 'NGT'),
	(0081, 3, '2023-07-22', 16, 24, 'NGT'),
	(0082, 10, '2023-07-22', 16, 24, 'NGT'),
	--sun 
	(0083, 1, '2023-07-23', 0, 4, 'EMN'),
	(0084, 5, '2023-07-23', 0, 4, 'EMN'),
	(0085, 17, '2023-07-23', 0, 4, 'EMN'),	

	(0086, 18, '2023-07-23', 4, 8, 'MN'),
	(0087, 20, '2023-07-23', 4, 8, 'MN'),
	
	(0089, 19, '2023-07-23', 8, 16, 'AFT'),
	(0090, 3, '2023-07-23', 8, 16, 'AFT'),
	(0091, 14, '2023-07-23', 8, 16, 'AFT'),
	
	(0092, 6, '2023-07-23', 16, 24, 'NGT'),
	(0093, 4, '2023-07-23', 16, 24, 'NGT'),
	(0094, 7, '2023-07-23', 16, 24, 'NGT');
GO

	 