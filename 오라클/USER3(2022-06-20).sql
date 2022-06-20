	 	CREATE TABLE tbl_images (
	 			i_seq NUMBER PRIMARY KEY,
		        i_bseq NUMBER  NOT NULL,
		        i_originalName VARCHAR2(255) NOT NULL,	
		        i_imageName VARCHAR2(255)	NOT NULL	
		);
create SEQUENCE seq_image
INCREMENT BY 1 START WITH 1;
Select * from tbl_images;