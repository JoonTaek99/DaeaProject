<%@page import="com.daea.dtos.EquiDto"%>
<%@page import="com.daea.daos.EquiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
    <style>
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
            
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"] {
            border: none;
            width: 100%;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: transparent;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="form-title">전산장비 정보</h2>
        <form action="insertData.board" method="post">
            <table>
                <tr>
                    <th>부서명</th>
                    <td>${dto.departmentName}</td>
                    <th>운영자</th>
                    <td>${dto.operator}</td>
                    <th>연락처</th>
                    <td>${dto.contactInfo}</td>
                </tr>
                <tr>
                    <th>용도</th>
                    <td>${dto.purpose}</td>
                    <th>모델명</th>
                    <td>${dto.modelName}</td>
                    <th>장비명</th>
                    <td>${dto.equipmentName}</td>
                </tr>
                <tr>
                    <th>도입일자</th>
                    <td><fmt:formatDate value="${dto.introductionDate}" pattern="yyyy년 MM월 dd일" /></td>
                    <th>자산번호</th>
                    <td>${dto.assetNumber}</td>
                    <th>IP</th>
                    <td>${dto.IP}</td>
                </tr>
                <tr>
                    <th>제조업체</th>
                    <td>${dto.manufacturer}</td>
                    <th>유지보수업체</th>
                    <td>${dto.maintenanceCompany}</td>
                    <th>업체연락처</th>
                    <td>${dto.maintenanceContact}</td>
                </tr>
            </table>

            <table>
                <tr>
                    <th>기본항목</th>
                    <th>사양</th>
                    <th>수량</th>
                    <th>비고</th>
                </tr>
                <tr>
                    <td>OS</td>
                    <td><input type="text" name="OS" value="${dto.OS}" readonly/></td>
                    <td><input type="number" name="OS_q" value="${dto.OS_q}" readonly/></td>
                    <td><input type="text" name="OS_n" value="${dto.OS_n}" readonly/></td>
                </tr>
                <tr>
                    <td>DBMS</td>
                    <td><input type="text" name="DBMS" value="${dto.DBMS}" readonly/></td>
                    <td><input type="number" name="DBMS_q" value="${dto.DBMS_q}" readonly/></td>
                    <td><input type="text" name="DBMS_n" value="${dto.DBMS_n}" readonly/></td>
                </tr>
                <tr>
                    <td>CPU</td>
                    <td><input type="text" name="CPUVersion" value="${dto.CPUVersion}" readonly/></td>
                    <td><input type="number" name="CPUVersion_q" value="${dto.CPUVersion_q}" readonly/></td>
                    <td><input type="text" name="CPUVersion_n" value="${dto.CPUVersion_n}" readonly/></td>
                </tr>
                <tr>
                    <td>Memory</td>
                    <td><input type="text" name="MemoryVersion" readonly/></td>
                    <td><input type="number" name="MemoryVersion_q" readonly/></td>
                    <td><input type="text" name="MemoryVersion_n" readonly/></td>
                </tr>
                <tr>
                    <td>Disk</td>
                    <td><input type="text" name="DiskVersion" readonly/></td>
                    <td><input type="number" name="DiskVersion_q" readonly/></td>
                    <td><input type="text" name="DiskVersion_n" readonly/></td>
                </tr>
                <tr>
                    <td>NW Card</td>
                    <td><input type="text" name="NWCard" value="${dto.NWCard}" readonly/></td>
                    <td><input type="number" name="NWCard_q" value="${dto.NWCard_q}" readonly/></td>
                    <td><input type="text" name="NWCard_n" value="${dto.NWCard_n}" readonly/></td>
                </tr>
                <tr>
                    <td>Power</td>
                    <td><input type="text" name="PowerVersion" readonly/></td>
                    <td><input type="number" name="PowerVersion_q" readonly/></td>
                    <td><input type="text" name="PowerVersion_n" readonly/></td>
                </tr>
                <tr>
                    <td>SN</td>
                    <td><input type="text" name="SN" value="${dto.SN}" readonly/></td>
                    <td><input type="number" name="SN_q" value="${dto.SN_q}" readonly/></td>
                    <td><input type="text" name="SN_n" value="${dto.SN_n}" readonly/></td>
                </tr>
                <tr>
                    <td>백신</td>
                    <td><input type="text" name="Antivirus" readonly/></td>
                    <td><input type="number" name="Antivirus_q" readonly/></td>
                    <td><input type="text" name="Antivirus_n" readonly/></td>
                </tr>
                <tr>
                    <td>Main Program</td>
                    <td><input type="text" name="MainProgram" readonly/></td>
                    <td><input type="number" name="MainProgram_q" readonly/></td>
                    <td><input type="text" name="MainProgram_n" readonly/></td>
                </tr>
                <tr>
                    <td>SSD</td>
                    <td><input type="text" name="SSD" value="${dto.SSD}" readonly/></td>
                    <td><input type="number" name="SSD_q" value="${dto.SSD_q}" readonly/></td>
                    <td><input type="text" name="SSD_n" value="${dto.SSD_n}" readonly/></td>
                </tr>
                <tr>
                    <td>DVD-ROM</td>
                    <td><input type="text" name="DVDROM" value="${dto.DVDROM}" readonly/></td>
                    <td><input type="number" name="DVDROM_q" value="${dto.DVDROM_q}" readonly/></td>
                    <td><input type="text" name="DVDROM_n" value="${dto.DVDROM_n}" readonly/></td>
                </tr>
                <tr>
                    <td>HDD</td>
                    <td><input type="text" name="HDD" value="${dto.HDD}" readonly/></td>
                    <td><input type="number" name="HDD_q" value="${dto.HDD_q}" readonly/></td>
                    <td><input type="text" name="HDD_n" value="${dto.HDD_n}" readonly/></td>
                </tr>
                <tr>
                    <td>NIC</td>
                    <td><input type="text" name="NIC" value="${dto.NIC}" readonly/></td>
                    <td><input type="number" name="NIC_q" value="${dto.NIC_q}" readonly/></td>
                    <td><input type="text" name="NIC_n" value="${dto.NIC_n}" readonly/></td>
                </tr>
                <tr>
                    <td>Controller</td>
                    <td><input type="text" name="Controller" readonly/></td>
                    <td><input type="number" name="Controller_q" readonly/></td>
                    <td><input type="text" name="Controller_n" readonly/></td>
                </tr>
                <tr>
                    <td>HBA</td>
                    <td><input type="text" name="HBA" value="${dto.HBA}" readonly/></td>
                    <td><input type="number" name="HBA_q" value="${dto.HBA_q}" readonly/></td>
                    <td><input type="text" name="HBA_n" value="${dto.HBA_n}" readonly/></td>
                </tr>
                <tr>
                    <td>Drive</td>
                    <td><input type="text" name="Drive" readonly/></td>
                    <td><input type="number" name="Drive_q" readonly/></td>
                    <td><input type="text" name="Drive_n" readonly/></td>
                </tr>
                <tr>
                    <td>Cartridge</td>
                    <td><input type="text" name="Cartridge" readonly/></td>
                    <td><input type="number" name="Cartridge_q" readonly/></td>
                    <td><input type="text" name="Cartridge_n" readonly/></td>
                </tr>
                <tr>
                    <td>Streaming Solution</td>
                    <td><input type="text" name="StreamingSolution" readonly/></td>
                    <td><input type="number" name="StreamingSolution_q" readonly/></td>
                    <td><input type="text" name="StreamingSolution_n" readonly/></td>
                </tr>
                <tr>
                    <td>Graphic Card</td>
                    <td><input type="text" name="GraphicCard" readonly/></td>
                    <td><input type="number" name="GraphicCard_q" readonly/></td>
                    <td><input type="text" name="GraphicCard_n" readonly/></td>
                </tr>
                <tr>
                    <td>Cluster</td>
                    <td><input type="text" name="Cluster" readonly/></td>
                    <td><input type="number" name="Cluster_q" readonly/></td>
                    <td><input type="text" name="Cluster_n" readonly/></td>
                </tr>
                <tr>
                    <td>Backup Repository</td>
                    <td><input type="text" name="BackupRepository" readonly/></td>
                    <td><input type="number" name="BackupRepository_q" readonly/></td>
                    <td><input type="text" name="BackupRepository_n" readonly/></td>
                </tr>
                <tr>
                    <td>Etc</td>
                    <td><input type="text" name="etc" value="${dto.etc}" readonly/></td>
                    <td><input type="number" name="etc_q" value="${dto.etc_q}" readonly/></td>
                    <td><input type="text" name="etc_n" value="${dto.etc_n}" readonly/></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
