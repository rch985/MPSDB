USE [MPS]
GO
--Married					CHAR(1),				--����״��[Sδ�顢M�ѻ顢Uδ֪]


DECLARE @ADMID VARCHAR(32);
SET @ADMID = '7e24b879e94745eb99d9fbffcbf6d1c1';

DECLARE @CURTIME DATETIME;
SET @CURTIME = '2021-09-23 11:31:29'

--����ϵͳ����Ա�˺���Ϣ
INSERT INTO TbSysUser(Id, Account, [Password], RealName, Gender, UserState, RegisterTime, HireTime, IsAdmin, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES(@ADMID, 'adm', 'pBga3b5ppIPfi/SqRHo20Q==', 'ϵͳ����Ա', 'M', 1, @CURTIME, @CURTIME, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--���붥�������˵���Ϣ
INSERT INTO TbSysMenu(Id, Pid, MenuName, MenuCode, MenuLevel, MenuState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysNaviMenu', 'TopNode', '�����˵�', 'SysNaviMenu', 1, 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--���붥��������Ϣ
INSERT INTO TbSysDepart(Id, Pid, DepartName, DepartCode, DepartState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysDepartment', 'TopNode', '���ŵ�λ', 'SysDepartment', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--���붥������������Ϣ
INSERT INTO TbSysArea(Id, Pid, AreaName, ShortName, AreaType, AreaCode, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysArea', 'TopNode', '�л����񹲺͹�', '�й�', 1, 'China', 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--���붥����Ŀ��Ϣ
INSERT INTO TbInfoColumn(Id, Pid, ColumnName, ColumnCode, ColumnState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('NodeInfoColumn', 'TopNode', '��Ŀģ��', 'InfoColumn', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--���붥����Ʒ������Ϣ
INSERT INTO TbGoodsClassify(Id, Pid, ClassifyName, ClassifyState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('NodeGoodsClassify', 'TopNode', '��Ʒ����', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME)




