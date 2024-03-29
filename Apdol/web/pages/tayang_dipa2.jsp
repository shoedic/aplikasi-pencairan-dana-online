<%-- 
    Document   : tayang_dipa2
    Created on : Dec 23, 2011, 10:56:47 PM
    Author     : wahid
--%>

<%@page import="apdol.string.format.Rupiah"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="apdol.model.DaftarDipa"%>
<%@page import="apdol.entity.Dipa"%>
<%@page import="javax.swing.JOptionPane"%>

<% List<Dipa> listDipa = (List<Dipa>) request.getAttribute("list_dipa");%>
<% Dipa dipa;%>
<%Rupiah rp = new Rupiah();%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%String logedUser = (String) session.getAttribute("username");%>
    <%String roleUser = (String) session.getAttribute("roleuser");%>
    <%String kodeSatker = (String) session.getAttribute("kode_satker");%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Tayang Dipa</title>
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
                <center><p ><h3>Tayang DIPA</p>
                    </h3>
                    <p>
                        <% Iterator<Dipa> iterator = listDipa.iterator();%>                
                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded-company">Nomor DIPA</th>
                                    <th scope="col" class="rounded-q1">Rincian Kegiatan</th>
                                    <th scope="col" class="rounded-q3">Pagu</th>
                                    <th scope="col" class="rounded-q3">Realisasi</th>
                                    <th scope="col" class="rounded-q4">Sisa Dana</th>                                  
                                </tr>
                            </thead>
                            <tbody>
                                <% while (iterator.hasNext()) {
                                        dipa = iterator.next();
                                        if (kodeSatker.equalsIgnoreCase(dipa.getRincianKegiatan().getSatker().getKodeSatker())) {%>
                                <tr>
                                    <td><%=dipa.getNomorDipa()%></td>
                                    <td><%=dipa.getRincianKegiatan().getSatker().getNamaSatker() + "-" + dipa.getRincianKegiatan().getKegiatan().getNmgiat() + "-" + dipa.getRincianKegiatan().getOutput().getNamaOutput() + "-" + dipa.getRincianKegiatan().getMataAnggaran().getNamaMataAnggaran()%></td>
                                    <td align="right"><%=rp.formatRupiah(dipa.getPagu())%></td>
                                    <td align="right"><%=rp.formatRupiah(dipa.getRealisasi())%></td>
                                    <td align="right"><%=rp.formatRupiah(dipa.getSisaDana())%></td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <span style="margin: 10px;">
                        </span>

                        <!-- end .content --></div>
                        <!-- end .container --></div>
                        </body>
                        </html>


