<%-- 
    Document   : monitoring_spm
    Created on : Dec 12, 2011, 3:20:40 AM
    Author     : AlfieSaHid
--%>
<%@page import="apdol.string.format.Rupiah"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="apdol.entity.SPM"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="apdol.model.DaftarSPM"%>

<% List<SPM> listSPM = (List<SPM>) request.getAttribute("list_spm");%>
<% SPM spm;%>
<% DateFormat df = new SimpleDateFormat("dd/MM/yyyy");%>
<%Rupiah rp = new Rupiah();%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%String logedUser = (String) session.getAttribute("username");%>
    <%String roleUser = (String) session.getAttribute("roleuser");%>
    <%String kodeSatker = (String) session.getAttribute("kode_satker");%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Monitoring SPM</title>
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
                    <li><a href="satker">Satuan Kerja</a></li>
                    <li><a href="bank_pos">Bank Pos</a></li>
                    <li><a href="pejabat">Pejabat</a></li>
                    <li><a href="program">Program</a></li>
                    <li><a href="kegiatan">Kegiatan</a></li>
                    <li><a href="output">Output</a></li>
                    <li><a href="mata_anggaran">Mata Anggaran</a></li>
                    <li><a href="rincian_kegiatan">Rincian Kegiatan</a></li>
                    <li><a href="lokasi">Lokasi</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="user">Registrasi User</a></li>
                </ul>
                <% } else if (roleUser.equals("2")) {%>
                <p><strong>Dokumen</strong></p> 
                <ul class="nav">
                    <li><a href="tayang_dipa2">Tayang DIPA</a></li>
                </ul>
                <p><strong>Pencairan</strong></p> 
                <ul class="nav">
                    <li><a href="spm">Surat Perintah Membayar</a></li>
                </ul>
                <p><strong>Monitoring</strong></p>
                <ul class="nav">
                    <li><a href="monitoring_spm">Monitoring SPM</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="cetak_spm">Cetak SPM</a></li>	
                    <li><a href="submit_spm">Submit ke KPPN</a></li>
                </ul>
                <% } else if (roleUser.equals("3")) {%>
                <p><strong>Dokumen</strong></p> 
                <ul class="nav">
                    <li><a href="tayang_dipa">Tayang DIPA</a></li>
                </ul>
                <p><strong>Penerimaan</strong></p> 
                <ul class="nav">
                    <li><a href="notifikasi_spm">Notifikasi SPM</a></li>
                    <li><a href="tolak_spm">Tolak SPM</a></li>
                </ul>  
                <p><strong>Pencairan</strong></p> 
                <ul class="nav">
                    <li><a href="proses_sp2d">Proses SP2D</a></li>
                    <li><a href="batal_sp2d">Batal SP2D</a></li>
                </ul>
                <p><strong>Utilitas</strong></p>
                <ul class="nav">
                    <li><a href="cetak_sp2d">Cetak SP2D</a></li>	
                </ul>  
                <% }%>
                <p></p>
                <p></p>
                <p></p>


                <!-- end .sidebar1 --></div>
            <div class="logout"><a href="logout"><img src="images/logout.png"/></a>
                <!-- end .logout --></div>
            <div class="content">
                <center><p><% if (logedUser != null) {%><%="Anda Login sebagai: " + logedUser%><%}%></p></center>
                <center><p><h3>Monitoring SPM</h3></p>
                    <% Iterator<SPM> iterator = listSPM.iterator();%>
                    <form >
                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th width="61" align="center" valign="middle" class="rounded-company" scope="col">Nomor SPM</th>
                                    <th width="58" align="center" valign="middle" class="rounded-q1" scope="col">Tanggal SPM</th>
                                    <th width="270" align="center" valign="middle" class="rounded-q3" scope="col">Rincian Kegiatan</th>
                                    <th width="106" align="center" valign="middle" class="rounded-q3" scope="col">Jumlah Keluar</th>
                                    <th width="111" align="center" valign="middle" class="rounded-q3" scope="col">Jumlah Potongan</th>
                                    <th width="106" align="center" valign="middle" class="rounded-q3" scope="col">Jumlah Bersih</th>
                                    <th width="29" align="center" valign="middle" class="rounded-q4" scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (iterator.hasNext()) {
                                        spm = iterator.next();
                                        if (kodeSatker.equalsIgnoreCase(spm.getRincianKegiatan().getSatker().getKodeSatker())) {%>        
                                <tr>
                                    <td><%=spm.getNomorSpm()%></td>
                                    <td><%=df.format(spm.getTanggalSPM())%></td>
                                    <td><%=spm.getRincianKegiatan().getSatker().getNamaSatker() + "." + spm.getRincianKegiatan().getKegiatan().getNmgiat() + "." + spm.getRincianKegiatan().getOutput().getNamaOutput() + "." + spm.getRincianKegiatan().getMataAnggaran().getNamaMataAnggaran()%></td>
                                    <td><%=spm.getJumlahKeluar()%></td>
                                    <td><%=spm.getJumlahPotongan()%></td>
                                    <td><%=spm.getJumlahBersih()%></td>
                                    <td><%=spm.getStatusSpm()%></td>
                                </tr>                              <%}%>      <%}%>
                            </tbody>
                        </table>
                    </form>
                </center>
                <!-- end .content --></div>
            <!-- end .container --></div>
    </body>
</html>
