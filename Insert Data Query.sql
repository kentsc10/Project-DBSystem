USE SaraviaPen


INSERT INTO Customer VALUES ('CTR001','Anton', 'Male', '1991-01-11', '082936584728', 'Jalan Kincir 1'),
							('CTR002','Budi', 'Male', '1990-02-11', '082936584736', 'Jalan Kincir 2'),
							('CTR003','Clarisa', 'Female', '1996-04-21', '082936584735', 'Jalan Kincir 3'),
							('CTR004','Diana', 'Female', '1995-02-14', '082936584468', 'Jalan Kincir 4'),
							('CTR005','Erica', 'Female', '1995-11-11', '082936587646', 'Jalan Kincir 5'),
							('CTR006','Farhan', 'Male', '2001-11-11', '082936584724', 'Jalan Kincir 6'),
							('CTR007','Gabriel', 'Male', '1999-07-15', '082936557728', 'Jalan Kincir 7'),
							('CTR008','Hanny', 'Female', '1997-08-01', '082935684728', 'Jalan Kincir 8'),
							('CTR009','Iris', 'Female', '2000-02-01', '082937654728', 'Jalan Kincir 9'),
							('CTR010','John', 'Male', '2003-04-16', '082936526428', 'Jalan Kincir 10')

INSERT INTO Staff VALUES ('STF001','Annie Darling', 'Female', '1991-02-21', '081449500697', 'Jalan Kacapiring 1', 3000000),
						 ('STF002','Bobby Marlin', 'Male', '1994-03-11', '081746352958', 'Jalan Kacapiring 2', 3500000),
						 ('STF003','Claudio', 'Male', '1996-06-15', '084374650697', 'Jalan Kacapiring 3', 3000000),
						 ('STF004','Danny Siph', 'Male', '1990-02-24', '089374856351', 'Jalan Kacapiring 4', 4000000),
						 ('STF005','Erina', 'Female', '1989-10-01', '084363637485', 'Jalan Kacapiring 5', 3000000),
						 ('STF006','Fannie', 'Female', '1988-09-14', '089033554675', 'Jalan Kacapiring 6', 5000000),
						 ('STF007','Gon', 'Male', '1996-04-15', '081428364958', 'Jalan Kacapiring 7', 3500000),
						 ('STF008','Hendra', 'Male', '1992-08-01', '082103455543', 'Jalan Kacapiring 8', 3750000),
						 ('STF009','Rahman', 'Male', '1996-03-16', '081377805395', 'Jalan Kacapiring 9', 4000000),
						 ('STF010','Jodi Jon', 'Female', '1987-04-21', '082936583928', 'Jalan Kacapiring 10', 6000000)

INSERT INTO Vendor VALUES ('VDR001', 'PT Garuda', 'Jalan Melati 1', '021938389485', 'sales@garuda.com'),
						  ('VDR002', 'Eagle Industry', 'Jalan Melati 2', '021174830597', 'sales@eagleind.com'),
						  ('VDR003', 'PT Gajahmada', 'Jalan Melati 3', '02158948763', 'sales@gajahmada.com'),
						  ('VDR004', 'PT Kerang', 'Jalan Melati 4', '021938576544', 'sales@kerang.com'),
						  ('VDR005', 'PT Harimau', 'Jalan Melati 5', '021984968294', 'sales@harimau.com'),
						  ('VDR006', 'PT Macan', 'Jalan Melati 6', '021028374644', 'sales@macan.com'),
						  ('VDR007', 'PT Kuda Jantan', 'Jalan Melati 7', '02119283726', 'sales@kuda.jantan.com'),
						  ('VDR008', 'PT Ular', 'Jalan Melati 8', '021334263486', 'sales@ular.com'),
						  ('VDR009', 'PT Surya Jaya', 'Jalan Melati 9', '021957563745', 'sales@surya.jaya.com'),
						  ('VDR010', 'PT Selamet 888', 'Jalan Melati 10', '021834216475', 'sales@selamet.888.com')

INSERT INTO Pen VALUES  ('PEN001', 'Milky White Pen', 10000, 200),
                        ('PEN002', 'Milky Blue Pen', 12000, 150),
                        ('PEN003','Ghost Pen', 20000, 160),
                        ('PEN004','Magic Pen', 30000, 120),
                        ('PEN005', 'Mega Pen', 45000, 140),
                        ('PEN006', 'Oracle Pen', 12000, 200),
                        ('PEN007','Business Pen', 32000, 110),
                        ('PEN008', 'Fun Pen', 49000, 100),
                        ('PEN009', 'Amazing Pen', 14000, 140),
                        ('PEN010', 'Limited Edition Pen', 33000, 160)

INSERT INTO PenMaterial VALUES ('PML001','PEN001','Material 1', 900, 1000),
                                ('PML002','PEN001','Material 2', 800, 150),
                                ('PML003','PEN001','Material 3', 800, 150),
                                ('PML004','PEN001','Material 4', 800, 120),
                                ('PML005','PEN001','Material 5', 800, 110),
                                ('PML006','PEN001','Material 6', 1500, 1050),
                                ('PML007','PEN001','Material 7', 800, 110),
                                ('PML008','PEN002','Material 8', 700, 1000),
                                ('PML009','PEN002','Material 9', 500, 1000),
                                ('PML010','PEN002','Material 10', 1500, 1000),
								('PML011','PEN003','Material 11', 2000, 1000),
								('PML012','PEN004','Material 12', 600, 1000),
								('PML013','PEN005','Material 13', 300, 1000),
								('PML014','PEN006','Material 14', 800, 1000),
								('PML015','PEN007','Material 15', 300, 1000),
								('PML016','PEN008','Material 16', 300, 1000),
								('PML017','PEN009','Material 17', 500, 1000),
								('PML018','PEN010','Material 18', 200, 1000)

								

INSERT INTO SalesTransaction VALUES ('SLT001','CTR001', 'STF001', '2020-01-12', 'Cash'),
                                    ('SLT002','CTR002', 'STF002', '2020-02-13', 'Cash'),
                                    ('SLT003','CTR003', 'STF003', '2020-02-22', 'Debit'), --e5
                                    ('SLT004','CTR004', 'STF004', '2020-03-25', 'Debit'),
                                    ('SLT005','CTR005', 'STF005', '2020-03-11', 'Cash'),
                                    ('SLT006','CTR006', 'STF006', '2020-04-15', 'Debit'),
                                    ('SLT007','CTR007', 'STF007', '2020-09-20', 'Debit'), -- e3 bkn 10
                                    ('SLT008','CTR008', 'STF008', '2020-05-01', 'Cash'),
                                    ('SLT009','CTR009', 'STF009', '2020-05-09', 'Cash'),
                                    ('SLT010','CTR010', 'STF010', '2020-06-25', 'Cash'), --e1 tgl 25
                                    ('SLT011','CTR004', 'STF006', '2020-07-15', 'Debit'),
                                    ('SLT012','CTR003', 'STF005', '2020-08-22', 'Debit'), --e5
                                    ('SLT013','CTR003', 'STF007', '2020-08-25', 'Cash'), --e1 tgl 25
                                    ('SLT014','CTR001', 'STF009', '2020-09-02', 'Cash'), --e3 10
                                    ('SLT015','CTR006', 'STF010', '2020-10-03', 'Cash')

INSERT INTO SalesTransactionDetail VALUES ('SLT001','PEN002',5),
                                    ('SLT001','PEN003',3),
                                    ('SLT001','PEN005',6),
                                    ('SLT002','PEN002',1),
                                    ('SLT002','PEN006',2),
                                    ('SLT002','PEN010',4),
                                    ('SLT003','PEN009',2),--e5 kcl
                                    ('SLT003','PEN010',2),--e5 kcl
                                    ('SLT004','PEN007',1),
                                    ('SLT005','PEN008',4),
                                    ('SLT005','PEN010',10),
                                    ('SLT006','PEN001',7),
                                    ('SLT006','PEN004',2),
                                    ('SLT007','PEN008',2), --e3 bkn 10
                                    ('SLT008','PEN004',4),
                                    ('SLT009','PEN009',8),
                                    ('SLT010','PEN001',4), --e1 tgl 25
                                    ('SLT011','PEN010',6),
                                    ('SLT012','PEN006',22), --e5 lebi
                                    ('SLT013','PEN009',2), --e1 tgl 25
                                    ('SLT013','PEN004',1),
                                    ('SLT013','PEN006',3),
                                    ('SLT014','PEN009',9), --e3 10
									('SLT014','PEN010',3), --e3
                                    ('SLT015','PEN007',6),
                                    ('SLT015','PEN003',1)

INSERT INTO PurchaseTransaction VALUES  ('PCT001','VDR001', 'STF001', '2020-01-05', 'Cash'),--e1 e8
                                        ('PCT002','VDR002', 'STF002', '2020-01-19', 'Cash'), --e6
                                        ('PCT003','VDR003', 'STF002', '2020-02-13', 'Cash'),
                                        ('PCT004','VDR004', 'STF004', '2020-03-14', 'Cash'), --e4
                                        ('PCT005','VDR005', 'STF005', '2020-04-21', 'Cash'),
                                        ('PCT006','VDR006', 'STF006', '2020-04-27', 'Cash'),
                                        ('PCT007','VDR007', 'STF007', '2020-05-16', 'Cash'),--e7bnyak
                                        ('PCT008','VDR008', 'STF008', '2020-06-03', 'Cash'),
                                        ('PCT009','VDR009', 'STF009', '2020-07-16', 'Debit'),--e4 10
                                        ('PCT010','VDR010', 'STF010', '2020-08-14', 'Debit'),--e4
                                        ('PCT011','VDR006', 'STF008', '2020-08-19', 'Debit'),
                                        ('PCT012','VDR003', 'STF004', '2020-09-02', 'Debit'),--e4
                                        ('PCT013','VDR001', 'STF003', '2020-10-10','Debit'),--e4
                                        ('PCT014','VDR010', 'STF004', '2020-11-22', 'Debit'),--e4
                                        ('PCT015','VDR010', 'STF010', '2020-12-5', 'Debit')	--e7dkit
										
INSERT INTO PurchaseTransactionDetail VALUES('PCT001','PML001',20),
											('PCT001','PML002',30),
											('PCT001','PML003',10),
											('PCT001','PML004',40),
											('PCT001','PML005',50),
											('PCT001','PML006',400),
											('PCT001','PML007',30),
											('PCT001','PML008',10),
											('PCT001','PML009',30),
											('PCT001','PML010',10),
                                            ('PCT002','PML011',30),
                                            ('PCT003','PML015',40),
                                            ('PCT003','PML016',20),
                                            ('PCT003','PML017',30),
                                            ('PCT004','PML018',5),--e4 bkn 10 
                                            ('PCT004','PML011',3),--e4 bkn10
                                            ('PCT005','PML016',70),
                                            ('PCT005','PML015',40),
                                            ('PCT006','PML014',10),
                                            ('PCT006','PML013',80),
                                            ('PCT007','PML011',150),--e7 bnyk
                                            ('PCT008','PML017',30),
                                            ('PCT008','PML014',60),
                                            ('PCT009','PML018',200), --e4 10
                                            ('PCT010','PML018',60),
                                            ('PCT011','PML011',30),
                                            ('PCT012','PML013',10),
                                            ('PCT013','PML012',30),
                                            ('PCT014','PML015',40),
                                            ('PCT014','PML016',60),
                                            ('PCT015','PML017',20)--e7 dkit

										