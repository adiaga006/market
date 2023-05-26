CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `market`;
CREATE TABLE `Product_Category_1` (
  `CategoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `Product_Category_1` VALUES('1','Rau củ'),('2','Thịt cá & trứng'),('3','Trái cây');

CREATE TABLE `Product_Category_2` (
  `CategoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  `ID`  bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_IDCategory_1` (`ID`),
  CONSTRAINT `FK_IDCategory_1` FOREIGN KEY (`ID`) REFERENCES `Product_Category_1` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `Product_Category_2` VALUES('1','Rau củ quả an toàn','1'),('2','Rau củ quả hữu cơ','1'),('3','Nấm & Đậu hũ','1'),('4','Thịt bò','2'),('5','Thịt heo','2'),('6','Cá','2'),('7','Trứng','2'),('8','Trái cây nhập','3'),('9','Trái cây Việt Nam','3');
  
CREATE TABLE `User` (
  `Userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role`     varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `User` VALUES('1','01 Nguyễn Viết Xuân','duytanktank@gmail.com','Nguyễn Đình Duy','2002-11-14','0934310725','Duy','adiaga1411','Admin');

CREATE TABLE `Product` (
  `ProductID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `Quantity` bigint(20) DEFAULT NULL,
  `Product_weight` varchar(255) DEFAULT NULL,
  `Description`  varchar(255) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Brand` 	varchar(255) DEFAULT NULL,
  `img_link` varchar(255) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_IDCategory_2` (`categoryID`),
  CONSTRAINT `FK_IDCategory_2` FOREIGN KEY (`categoryID`) REFERENCES `Product_Category_2` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `Product` VALUES('1','Rau răm','1000','50g','Bảo quản ở ngăn mát tủ lạnh','4.950','Việt Nam','https://tinyurl.com/48zy4khc','1'); 


CREATE TABLE `Order` (
  `OrderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TotalValue` float DEFAULT NULL,
  `Status`  bigint(20) DEFAULT NULL,
  `Payment` bigint(20) DEFAULT NULL,
  `User` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Orderid`),
  KEY `FK_User` (`User`),
  KEY `FK_Status` (`Status`),
  KEY `FK_Payment` (`Payment`),
  CONSTRAINT `FK_User` FOREIGN KEY (`User`) REFERENCES `User` (`UserID`),
  CONSTRAINT `FK_Status` FOREIGN KEY (`Status`) REFERENCES `OrderStatus` (`StatusID`),
  CONSTRAINT `FK_Payment` FOREIGN KEY (`Payment`) REFERENCES `Payment` (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

CREATE TABLE `OrderDetail` (
   `OrderDeatailID` bigint(20) NOT NULL AUTO_INCREMENT,
   `Quantity` bigint(20) DEFAULT NULL,
   `Address_to_ship` varchar(255) DEFAULT NULL,
   `DateCreated` datetime DEFAULT NULL,
   `Price` FLoat DEFAULT NULL,
   `OrderID` bigint(20) DEFAULT NULL,
   `ProductID` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`OrderDeatailID`),
    KEY `FK_ProductID_1` (`ProductID`),
	KEY `FK_OrderID` (`OrderID`),
	CONSTRAINT `FK_ProductID_1` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`),
    CONSTRAINT `FK_ProductID` FOREIGN KEY (`OrderID`) REFERENCES `Order`(`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  



CREATE TABLE `Payment` (
   `PaymentID` bigint(20) NOT NULL AUTO_INCREMENT,
   `PaymentDate` datetime DEFAULT NULL,
   `PaymentMethod` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  

CREATE TABLE `OrderStatus` (
   `StatusID` bigint(20) NOT NULL AUTO_INCREMENT,
   `Description` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  

CREATE TABLE `Cart` (
   `CartID` bigint(20) NOT NULL AUTO_INCREMENT,
   `User` bigint(20) DEFAULT NULL,
   `TotalValue` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`CartID`),
    KEY `FK_UserID` (`User`),
	CONSTRAINT `FK_UserID` FOREIGN KEY (`User`) REFERENCES `User`(`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  

CREATE TABLE `Promotion` (
   `PromotionID` bigint(20) NOT NULL AUTO_INCREMENT,
   `Description` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`PromotionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  

CREATE TABLE `CartDetail` (
   `CartDetailID` bigint(20) NOT NULL AUTO_INCREMENT,
   `Quantity` bigint(20) DEFAULT NULL,
   `TotalValue` bigint(20) DEFAULT NULL,
   `CartID` bigint(20) DEFAULT NULL,
   `ProductID` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`CartDetailID`),
    KEY `FK_CartID` (`CartID`),
    KEY `FK_ProductID_2` (`ProductID`),
	CONSTRAINT `FK_CartID` FOREIGN KEY (`CartID`) REFERENCES `Cart`(`CartID`),
    CONSTRAINT `FK_ProductID_2` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  
