<%-- 
    Document   : edit_bank_pos
    Created on : Nov 26, 2011, 12:11:26 PM
    Author     : AlfieSaHid
--%>
<%@page import="apdol.model.DaftarBankPos"%>
<%@page import="apdol.entity.BankPos"%>
<%@page import="javax.swing.JOptionPane"%>

<% BankPos bankpos = (BankPos) request.getAttribute("bankpos_edit");%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%String logedUser = (String) session.getAttribute("username");%>
    <%String roleUser = (String) session.getAttribute("roleuser");%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Edit Bank Pos</title>
        <link href="styles/style2.css" rel="stylesheet" type="text/css" /><!--[if lte IE 7]>
        <style>
        .content { margin-right: -1px; } /* this 1px negative margin can be placed on any of the columns in this layout with the same corrective effect. */
        ul.nav a { zoom: 1; }  /* the zoom property gives IE the hasLayout trigger it needs to correct extra whiltespace between the links */
        </style>
        <![endif]-->
    </head>

    <body>
        <center><div class="header"><img src="images/sederhana.jpg" /></div></center>

        <div class="container">
            <div class="sidebar1">
                <% if (roleUser.equals("1")) {%>
                <p><strong>Dokumen</strong></p> 
                <ul class="nav">
                    <li><a href="dipa">DIPA</a></li>
                </ul>
                <p><strong>Referensi</strong></p> 
                <ul class="nav">
                    <li><a href="#">Satuan Kerja</a></li>
                    <li><a href="bank_pos">Bank Pos</a></li>
                    <li><a href="pejabat">Pejabat</a></li>
                    <li><a href="program">Program</a></li>
                    <li><a href="kegiatan">Kegiatan</a></li>
                    <li><a href="output">Output</a></li>
                    <li><a href="mata_anggaran">Mata Anggaran</a></li>
                    <li><a href="lokasi">Lokasi</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="register">Registrasi User</a></li>
                </ul>
                <% } else if (roleUser.equals("2")) {%>
                <p><strong>Dokumen</strong></p> 
                <ul class="nav">
                    <li><a href="#">Tayang DIPA</a></li>
                </ul>
                <p><strong>Pencairan</strong></p> 
                <ul class="nav">
                    <li><a href="#">Surat Perintah Membayar</a></li>
                </ul>
                <p><strong>Monitoring</strong></p>
                <ul class="nav">
                    <li><a href="#">Realisasi</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="#">Cetak SPM</a></li>	
                    <li><a href="#">Submit ke KPPN</a></li>
                </ul>
                <% } else if (roleUser.equals("3")) {%>
                <p><strong>Dokumen</strong></p> 
                <ul class="nav">
                    <li><a href="#">Tayang DIPA</a></li>
                </ul>
                <p><strong>Penerimaan</strong></p> 
                <ul class="nav">
                    <li><a href="#">Notifikasi SPM</a></li>
                    <li><a href="#">Tolak SPM</a></li>
                </ul>  
                <p><strong>Pencairan</strong></p> 
                <ul class="nav">
                    <li><a href="#">Proses SP2D</a></li>
                    <li><a href="#">Batal SP2D</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="#">Cetak SP2D</a></li>	
                </ul>  
                <% }%>
                <p></p>
                <p></p>
                <p></p>


                <!-- end .sidebar1 --></div>
            <div class="logout"><a href="logout">[Log Out]</a>
                <!-- end .logout --></div>
            <div class="content">
                <table border="0" cellspacing="0" cellpadding="0" width="800">
                <tr>
                    <td>
                        <table width="997" border="0" align="left">
                            <tr style="vertical-align: top">
                                <td width="987" style="vertical-align: top"  align="left">                                    
                                    <center><p><h3 style="color: blue;">Edit Data Bank Pos</h3></p>
                                    <form action="proses_edit_bank_pos" method="post" >
                                    <table width="509" height="89">
                                        <tr>
                                            <td width="150">Kode Bank Pos</td><td><input name="kode_bankpos" type="text" style="width: 30px" value ="<%=bankpos.getKdbankpos()%>" size="3" maxlength="3"></td>
                                        </tr>
                                        <tr>
                                            <td>Nama Bank Pos</td><td><input type="text" name="nama_bankpos" value="<%=bankpos.getNmbankpos()%>" style="width: 300px" >
                                              <input type="hidden" name="id_edit_bankpos" value="<%=bankpos.getId()%>" /></td>
                                            <td>&nbsp;</td>                                        
                                        </tr>                                       
                                        <tr>
                                            <td></td><td><input type="reset"><input type="submit" value="Simpan" ></td>
                                        </tr>
                                    </table>
                                    </form> </center>
                                </td>
                                </tr>
                        </table>
                  </td>
                </tr>
                </table>
             <!-- end .content --></div>
         <!-- end .container --></div>
    </body>
</html>