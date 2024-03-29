create database ĐTDĐ;
use ĐTDĐ;

--tao bang SAN PHAM
create table SAN_PHAM 
(
   MA_SP                varchar(5)                     not null,
   MA_LOAI_SP           varchar(5)                     not null,
   MA_NSX               varchar(5)                     not null,
   STT                  numeric                        not null,
   TEN_SP               varchar(20)                    null,
   MO_TA_SP             varchar(30)                    null,
   HINH_ANH             char(50)                       null,
   constraint PK_SAN_PHAM primary key (MA_SP)
);
alter table SAN_PHAM
   add constraint FK_SP_DVT foreign key (STT) references DON_VI_TINH (STT)on update cascade on delete cascade;

alter table SAN_PHAM
   add constraint FK_SP_NSX foreign key (MA_NSX)references NHA_SAN_XUAT (MA_NSX)on update cascade on delete cascade;

alter table SAN_PHAM
   add constraint FK_SP_LSP foreign key (MA_LOAI_SP)references LOAI_SAN_PHAM (MA_LOAI_SP)on update cascade on delete cascade;


--tao bang LOAI SAN PHAM
create table LOAI_SAN_PHAM 
(
   MA_LOAI_SP           varchar(5)                     not null,
   TEN_LOAI_SP          varchar(20)                    null,
   constraint PK_LOAI_SAN_PHAM primary key (MA_LOAI_SP)
);

--tao bang HOA DON
create table HOA_DON 
(
   STT_HOA_DON          char(5)                        not null,
   STT_DAT_HANG         char(5)                        not null,
   MA_NHAN_VIEN         varchar(5)                     not null,
   MA_KHACH_HANG        varchar(5)                     not null,
   STT_PHIEU            char(5)                        not null,
   NGAY_LAP             timestamp                      null,
   TRI_GIA              numeric                        null,
   constraint PK_HOA_DON primary key (STT_HOA_DON)
);

alter table HOA_DON
   add constraint FK_HD_GH foreign key (STT_DAT_HANG)references GIO_HANG (STT_DAT_HANG)on update cascade on delete cascade;

alter table HOA_DON
   add constraint FK_HD_PBH foreign key (STT_PHIEU)references PHIEU_BAO_HANH (STT_PHIEU)on update cascade on delete cascade;

alter table HOA_DON
   add constraint FK_HD_KH foreign key (MA_KHACH_HANG)references KHACH_HANG (MA_KHACH_HANG)on update cascade on delete cascade;

alter table HOA_DON
   add constraint FK_HD_NV foreign key (MA_NHAN_VIEN)references NHAN_VIEN (MA_NHAN_VIEN)on update cascade on delete cascade;
      
--tao bang NHAN VIEN
create table NHAN_VIEN 
(
   MA_NHAN_VIEN         varchar(5)                     not null,
   HO_TEN               varchar(20)                    null,
   NAM_SINH_NV          date                           null,
   GIOI_TINH_SV         smallint                       null,
   CMND                 char(10)                       null,
   SDT                  char(12)                       null,
   TAI_KHOAN_NV         varchar(30)                    null,
   EMAIL                varchar(20)                    null,
   constraint PK_NHAN_VIEN primary key (MA_NHAN_VIEN)
);

--tao bang KHACH HANG
create  table KHACH_HANG 
(
   MA_KHACH_HANG        varchar(5)                     not null,
   TEN_KHACH_HANG       varchar(20)                    null,
   NAM_SINH             date                           null,
   GIOI_TINH            smallint                       null,
   DIA_CHI              char(30)                       null,
   SO_TAI_KHOAN         varchar(15)                    null,
   constraint PK_KHACH_HANG primary key (MA_KHACH_HANG)
);


--tao bang NHA SAN XUAT
create  table NHA_SAN_XUAT 
(
   MA_NSX               varchar(5)                     not null,
   TEN_NSX              varchar(20)                    null,
   constraint PK_NHA_SAN_XUAT primary key (MA_NSX)
);
--tao bang DON VI TINH
create table DON_VI_TINH 
(
   STT                  numeric                        not null,
   DON_VI               varchar(20)                    null,
   constraint PK_DON_VI_TINH primary key (STT)
);
--tao bang KHUYEN MAI
create table KHUYEN_MAI 
(
   MA_KM                varchar(5)                     not null,
   NGAY_GIO             timestamp                      not null,
   TEN_KM               varchar(20)                    null,
   constraint PK_KHUYEN_MAI primary key (MA_KM)
);
alter table KHUYEN_MAI
   add constraint FK_KM_TĐ foreign key (NGAY_GIO)references THOI_DIEM (NGAY_GIO)on update cascade on delete cascade;
   
-- tao bang DON GIA BAN
create  table DON_GIA_BAN 
(
   NGAY_GIO             timestamp                      not null,
   MA_SP                varchar(5)                     not null,
   DON_GIA_BAN          float                          null,
   constraint PK_DON_GIA_BAN primary key clustered (NGAY_GIO, MA_SP)
);

alter table DON_GIA_BAN add constraint FK_ĐGB_SP foreign key (MA_SP)references SAN_PHAM (MA_SP)on update cascade on delete cascade;

alter table DON_GIA_BAN
   add constraint FK_ĐGB_TĐ foreign key (NGAY_GIO)references THOI_DIEM (NGAY_GIO)on update cascade on delete cascade;
   
--tao bang GIO HANG
create table GIO_HANG 
(
   STT_DAT_HANG         char(5)                        not null,
   MA_KHACH_HANG        varchar(5)                     not null,
   NGAY_DAT_HANG        timestamp                      null,
   constraint PK_GIO_HANG primary key (STT_DAT_HANG)
);

alter table GIO_HANG
   add constraint FK_GH_KH foreign key (MA_KHACH_HANG)references KHACH_HANG (MA_KHACH_HANG)on update cascade on delete cascade;
   
--tao bang TIN TUC
create  table TIN_TUC 
(
   STT_TIN_TUC          numeric                        not null,
   MA_NHAN_VIEN         varchar(5)                     not null,
   MA_LOAI_TIN_TUC      varchar(5)                     not null,
   NOI_DUNG_TIN_TUC     varchar(50)                    null,
   NGAY_VIET_TIN_TUC    timestamp                      null,
   constraint PK_TIN_TUC primary key (STT_TIN_TUC)
);
alter table TIN_TUC
   add constraint FK_TT_NV foreign key (MA_NHAN_VIEN)references NHAN_VIEN (MA_NHAN_VIEN)on update cascade on delete cascade;

alter table TIN_TUC
   add constraint FK_TT_LTT foreign key (MA_LOAI_TIN_TUC)references LOAI_TIN_TUC (MA_LOAI_TIN_TUC)on update cascade on delete cascade;

--tao bang LOAI TIN TUC
create  table LOAI_TIN_TUC 
(
   MA_LOAI_TIN_TUC      varchar(5)                     not null,
   TEN_LOAI_TIN_TUC     varchar(20)                    null,
   constraint PK_LOAI_TIN_TUC primary key (MA_LOAI_TIN_TUC)
);
--tao bang BINH LUAN
create  table BINH_LUAN 
(
   MA_KHACH_HANG        varchar(5)                     not null,
   MA_SP                varchar(5)                     not null,
   STT_BINH_LUAN        numeric                        not null,
   NOI_DUNG_BINH_LUAN   char(50)                       null,
   THOI_GIAN_BINH_LUAN  timestamp                      null,
   constraint PK_BINH_LUAN primary key (MA_KHACH_HANG, MA_SP, STT_BINH_LUAN)
);

alter table BINH_LUAN
   add constraint FK_BL_KH foreign key (MA_KHACH_HANG)references KHACH_HANG (MA_KHACH_HANG) on update cascade on delete cascade;

alter table BINH_LUAN
   add constraint FK_BL_SP foreign key (MA_SP)references SAN_PHAM (MA_SP)on update cascade on delete cascade;
   
--tao ban KM-SP
create table KM_SP 
(
   MA_KM                varchar(5)                     not null,
   MA_SP                varchar(5)                     not null,
   constraint PK_KM_SP primary key clustered (MA_KM, MA_SP)
);

alter table KM_SP
   add constraint FK_KM_SP_KM foreign key (MA_KM)references KHUYEN_MAI (MA_KM) on update cascade on delete cascade;

alter table KM_SP
   add constraint FK_KM_SP_SP foreign key (MA_SP)references SAN_PHAM (MA_SP)on update cascade on delete cascade;
   
--tao bang XEM BINH LUAN
create  table XEM_BINH_LUAN 
(
   MA_NHAN_VIEN         varchar(5)                     not null,
   MA_KHACH_HANG        varchar(5)                     not null,
   MA_SP                varchar(5)                     not null,
   STT_BINH_LUAN        numeric                        not null,
   constraint PK_XEM_BINH_LUAN primary key clustered (MA_KHACH_HANG, MA_NHAN_VIEN, MA_SP, STT_BINH_LUAN)
);
alter table XEM_BINH_LUAN
   add constraint FK_XBL_NV foreign key (MA_NHAN_VIEN)references NHAN_VIEN (MA_NHAN_VIEN)on update cascade on delete cascade;

alter table XEM_BINH_LUAN
   add constraint FK_XBL foreign key (MA_KHACH_HANG, MA_SP, STT_BINH_LUAN)references BINH_LUAN (MA_KHACH_HANG, MA_SP, STT_BINH_LUAN)on update cascade on delete cascade;
   

--tao bang THOI DIEM
create table THOI_DIEM 
(
   NGAY_GIO             timestamp                      not null,
   constraint PK_THOI_DIEM primary key (NGAY_GIO)
);
--tao bang PHIEU NHAP HANG
create  table PHIEU_NHAP_HANG 
(
   STT_PHIEU_NHAP       char(256)                      not null,
   MA_NSX               varchar(5)                     not null,
   MA_NHAN_VIEN         varchar(5)                     not null,
   NGAY_LAP_PHIEU_NHAP  timestamp                      null,
   TONG_TIEN            numeric                        null,
   constraint PK_PHIEU_NHAP_HANG primary key (STT_PHIEU_NHAP)
);
alter table PHIEU_NHAP_HANG
   add constraint FK_PNH_NV foreign key (MA_NHAN_VIEN)references NHAN_VIEN (MA_NHAN_VIEN)on update cascade on delete cascade;

alter table PHIEU_NHAP_HANG
   add constraint FK_PNH_NSX foreign key (MA_NSX)references NHA_SAN_XUAT (MA_NSX)on update cascade on delete cascade;
  
--tao bang PHIEU BAO HANH
create table PHIEU_BAO_HANH 
(
   STT_PHIEU            char(5)                        not null,
   STT_HOA_DON          char(5)                        not null,
   TEN_PHIEU            varchar(20)                    null,
   THOI_GIAN_BH         timestamp                      null,
   constraint PK_PHIEU_BAO_HANH primary key (STT_PHIEU)
);
alter table PHIEU_BAO_HANH
   add constraint FK_PBH_HD foreign key (STT_HOA_DON)references HOA_DON (STT_HOA_DON)on update cascade on delete cascade;
   
--tao bang CHI TIET HOA DON
create  table CHI_TIET_HOA_DON 
(
   MA_SP                varchar(5)                     not null,
   STT_HOA_DON          char(5)                        not null,
   SO_LUONG             numeric                        null,
   DON_GIA              char(20)                       null,
   constraint PK_CHI_TIET_HOA_DON primary key clustered (MA_SP, STT_HOA_DON)
);
alter table CHI_TIET_HOA_DON
   add constraint FK_CTHD_HD foreign key (STT_HOA_DON)references HOA_DON (STT_HOA_DON)on update cascade on delete cascade;

alter table CHI_TIET_HOA_DON
   add constraint FK_CTHD_SP foreign key (MA_SP)references SAN_PHAM (MA_SP)on update cascade on delete cascade;
   
--tao bang CHI TIET GIO HANG
create table CHI_TIET_GIO_HANG(
   MA_SP                varchar(5)                     not null,
   STT_DAT_HANG         char(5)                        not null,
   SO_LUONG_HANG        numeric                        null,
   DON_GIA_HANG         numeric                        null,
   constraint PK_CHI_TIET_GIO_HANG primary key clustered (MA_SP, STT_DAT_HANG)
);


alter table CHI_TIET_GIO_HANG
   add constraint FK_CTGH_GH foreign key (STT_DAT_HANG)references GIO_HANG (STT_DAT_HANG)on update cascade on delete cascade;

alter table CHI_TIET_GIO_HANG
   add constraint FK_CTGH_SP foreign key (MA_SP)references SAN_PHAM (MA_SP) on update cascade  on delete cascade;
   
--tao bang CHI TIET PHIEU NHAP
create table CHI_TIET_PHIEU_NHAP 
(
   MA_SP                varchar(5)                     not null,
   STT_PHIEU_NHAP       char(256)                      not null,
   SO_LUONG_NHAP        numeric                        null,
   DON_GIA_NHAP         float                          null,
   constraint PK_CHI_TIET_PHIEU_NHAP primary key clustered (MA_SP, STT_PHIEU_NHAP)
);
alter table CHI_TIET_PHIEU_NHAP
   add constraint FK_CTPH_PNH foreign key (STT_PHIEU_NHAP) references PHIEU_NHAP_HANG (STT_PHIEU_NHAP)on update cascade on delete cascade;

alter table CHI_TIET_PHIEU_NHAP
   add constraint FK_CTPN_SP foreign key (MA_SP)references SAN_PHAM (MA_SP)on update cascade on delete cascade;