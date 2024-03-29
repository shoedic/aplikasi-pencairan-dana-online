/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apdol.servlet;

import apdol.comparator.SpmComparator;
import apdol.entity.SPM;
import apdol.model.DaftarSPM;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Accio
 */
public class ProsesNotifikasiSPMServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SPM spm = new SPM();
            DaftarSPM daftarSPM = new DaftarSPM();
            String jsp = "";

            Date now = new Date();
            String keterangan = request.getParameter("keterangan");
            String statSPM = "Diterima KPPN";
            String idSPM = request.getParameter("id_edit_spm");
            Long longIdSPM = Long.parseLong(idSPM);
            spm = daftarSPM.findSPM(longIdSPM);
            
            if (keterangan == "") {
                JOptionPane.showMessageDialog(null, "Keterangan tidak boleh kosong !");
                jsp = "/pages/input_notifikasi_spm.jsp";
                request.setAttribute("spm_notifikasi", spm);
            } else {
                spm.setTanggalTerima(now);
                spm.setStatusSpm(statSPM);
                spm.setKeteranganNotifikasi(keterangan);
                daftarSPM.edit(spm);
                List<SPM> listSPM = daftarSPM.getSPM();
                Collections.sort(listSPM, new SpmComparator());
                request.setAttribute("list_spm", listSPM);
                jsp = "pages/notifikasi_spm.jsp";
            }
            
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(jsp);
            requestDispatcher.forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
