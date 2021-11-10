USE [MPS]
GO
--Married					CHAR(1),				--婚姻状况[S未婚、M已婚、U未知]


DECLARE @ADMID VARCHAR(32);
SET @ADMID = '7e24b879e94745eb99d9fbffcbf6d1c1';

DECLARE @CURTIME DATETIME;
SET @CURTIME = '2021-09-23 11:31:29'

--插入系统管理员账号信息
INSERT INTO TbSysUser(Id, Account, [Password], RealName, Gender, UserState, RegisterTime, HireTime, IsAdmin, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES(@ADMID, 'adm', 'pBga3b5ppIPfi/SqRHo20Q==', '系统管理员', 'M', 1, @CURTIME, @CURTIME, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--插入顶级导航菜单信息
INSERT INTO TbSysMenu(Id, Pid, MenuName, MenuCode, MenuLevel, MenuState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysNaviMenu', 'TopNode', '导航菜单', 'SysNaviMenu', 1, 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--插入顶级部门信息
INSERT INTO TbSysDepart(Id, Pid, DepartName, DepartCode, DepartState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysDepartment', 'TopNode', '部门单位', 'SysDepartment', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--插入顶级行政区划信息
INSERT INTO TbSysArea(Id, Pid, AreaName, ShortName, AreaType, AreaCode, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('SysArea', 'TopNode', '中华人民共和国', '中国', 1, 'China', 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--插入顶级栏目信息
INSERT INTO TbInfoColumn(Id, Pid, ColumnName, ColumnCode, ColumnState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('NodeInfoColumn', 'TopNode', '栏目模块', 'InfoColumn', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME);

--插入顶级商品分类信息
INSERT INTO TbGoodsClassify(Id, Pid, ClassifyName, ClassifyState, SortIndex, IsDeleted, Creater, CreateTime, Updater, UpdateTime)
VALUES('NodeGoodsClassify', 'TopNode', '商品分类', 1, 1, 0, @ADMID, @CURTIME, @ADMID, @CURTIME)




