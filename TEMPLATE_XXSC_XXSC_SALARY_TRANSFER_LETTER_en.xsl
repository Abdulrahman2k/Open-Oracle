<?xml version = '1.0' encoding = 'utf-8'?>
<!-- $Header: TEMPLATE_XXSC_XXSC_SALARY_TRANSFER_LETTER_en.xsl 115.0 2016/05/23 09:25:40 xdouser noship $ -->
<!-- dbdrv: none -->

<!--Generated by Oracle BI Publisher 10.1.3.4.2-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:ora="http://www.oracle.com/XSL/Transform/java/" xmlns:xdofo="http://xmlns.oracle.com/oxp/fo/extensions" xmlns:xdoxslt="http://www.oracle.com/XSL/Transform/java/oracle.apps.xdo.template.rtf.XSLTFunctions" xmlns:xdoxliff="urn:oasis:names:tc:xliff:document:1.1" xmlns:xlink="http://www.w3.org/1999/xlink">
   <xsl:param name="_XDOCALENDAR">GREGORIAN</xsl:param>
   <xsl:param name="_XDOLOCALE">en-US</xsl:param>
   <xsl:param name="_XDOTIMEZONE">GMT</xsl:param>
   <xsl:param name="_XDODFOVERRIDE">;</xsl:param>
   <xsl:param name="_XDOCURMASKS">;</xsl:param>
   <xsl:param name="_XDONFSEPARATORS"></xsl:param>
   <xsl:param name="_XDOCHARTTYPE">image/svg+xml</xsl:param>
   <xsl:param name="_XDOOUTPUTFORMAT">application/pdf</xsl:param>
   <xsl:param name="_XDOSVGFONTEMBED">true</xsl:param>
   <xsl:param name="_XDOCTX">#</xsl:param>
   <xsl:variable name="_XDOXSLTCTX" select="xdoxslt:set_xslt_locale($_XDOCTX, $_XDOLOCALE, $_XDOTIMEZONE, $_XDOCALENDAR, concat($_XDODFOVERRIDE,'',$_XDOCURMASKS,'',$_XDONFSEPARATORS))"/>
   <xsl:variable name="_XDOFOPOS" select="''"/>
   <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
   <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
   <xsl:variable name="_XDOFOOSTOTAL" select="number(0)"/>
   <xsl:template match="/">
      <fo:root xdofo:nf-separator="{$_XDONFSEPARATORS}">
         <fo:layout-master-set>
            <fo:simple-page-master master-name="master0" margin-left="66.6pt" margin-right="66.6pt" page-height="792.0pt" page-width="612.0pt" margin-top="36.0pt" margin-bottom="36.0pt">
               <fo:region-before region-name="region-header" extent="36.0pt"/>
               <fo:region-body region-name="region-body" margin-top="36.0pt" margin-bottom="36.0pt"/>
               <fo:region-after region-name="region-footer" extent="36.0pt" display-align="after"/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="master0">
            <fo:title>RTF Template</fo:title>
            <xsl:variable name="_PW" select="number(612.0)" xdofo:alt="internal"/>
            <xsl:variable name="_PH" select="number(792.0)" xdofo:alt="internal"/>
            <xsl:variable name="_ML" select="number(72.0)" xdofo:alt="internal"/>
            <xsl:variable name="_MR" select="number(72.0)" xdofo:alt="internal"/>
            <xsl:variable name="_MT" select="number(72.0)" xdofo:alt="internal"/>
            <xsl:variable name="_MB" select="number(72.0)" xdofo:alt="internal"/>
            <xsl:variable name="_HY" select="number(36.0)" xdofo:alt="internal"/>
            <xsl:variable name="_FY" select="number(36.0)" xdofo:alt="internal"/>
            <xsl:variable name="_SECTION_NAME" select="string('master0')" xdofo:alt="internal"/>
            <fo:static-content flow-name="region-header">
               <fo:block xdofo:tab-stops="center:234.0pt:space right:468.0pt:space" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2"/>
               <xsl:variable name="_XDOFOOSTOTAL" select="(number(concat('0', $_XDOFOPOS2)) - 1) * number(concat('0', $_XDOFOTOTAL))"/>
               <xsl:for-each select=".//G_EMP_DETAILS_GROUP">
                  <xsl:variable name="_XDOFOPOS" select="concat($_XDOFOPOS, '_', position())"/>
                  <xsl:variable name="_XDOFOPOS2" select="number(concat('0', $_XDOFOOSTOTAL)) + position()"/>
               </xsl:for-each>
            </fo:static-content>
            <fo:static-content flow-name="region-footer">
               <fo:block xdofo:tab-stops="center:234.0pt:space right:468.0pt:space" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2"/>
            </fo:static-content>
            <fo:flow flow-name="region-body">
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:xliff-note="TODAY_DATE" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">
                     <xsl:value-of select=".//TODAY_DATE" xdofo:field-name="TODAY_DATE"/>
                  </fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">The Manager</fo:inline>
               </fo:block>
               <fo:block xdofo:xliff-note="BANK_NAME" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">
                     <xsl:value-of select=".//BANK_NAME" xdofo:field-name="BANK_NAME"/>
                  </fo:inline>
               </fo:block>
               <fo:block xdofo:xliff-note="BRANCH_NAME" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">
                     <xsl:value-of select=".//BRANCH_NAME" xdofo:field-name="BRANCH_NAME"/>
                  </fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">Private &amp; Confidential</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="14.280001pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt" font-weight="bold">Re: Salary Transfer Letter</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">Dear Sir/Madam,</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:xliff-note="PERSON_NAME, NATIONALITY, NATIONAL_IDENTIFIER, LEGAL_EMPLOYER, EFFECTIVE_START_DATE, JOB_NAME, DEPARTMENT, LOCATION" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">This is to confirm that <xsl:value-of select=".//PERSON_NAME" xdofo:field-name="PERSON_NAME"/>, holder of <xsl:value-of select=".//NATIONALITY" xdofo:field-name="NATIONALITY"/>  passport number </fo:inline>
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt" color="#000000">
                     <xsl:value-of select=".//NATIONAL_IDENTIFIER" xdofo:field-name="NATIONAL_IDENTIFIER"/>
                  </fo:inline>
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt"> has been employed with </fo:inline>
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt" color="#000000"><xsl:value-of select=".//LEGAL_EMPLOYER" xdofo:field-name="LEGAL_EMPLOYER"/> </fo:inline>
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">since <xsl:value-of select=".//EFFECTIVE_START_DATE" xdofo:field-name="EFFECTIVE_START_DATE"/> and currently holds the position of  <xsl:value-of select=".//JOB_NAME" xdofo:field-name="JOB_NAME"/>  -  <xsl:value-of select=".//DEPARTMENT" xdofo:field-name="DEPARTMENT"/> in <xsl:value-of select=".//LOCATION" xdofo:field-name="LOCATION"/>.</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:xliff-note="PERSON_NAME,   ,   " linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0pt">
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt"><xsl:value-of select=".//PERSON_NAME" xdofo:field-name="PERSON_NAME"/>  is currently drawing a monthly salary of AED<xsl:variable xdofo:ctx="17" xdofo:ctx2="wrapper" name="fv1"><xsl:value-of select=".//SALARY" xdofo:field-name="SALARY"/></xsl:variable><xsl:value-of select="$fv1"/> inclusive of all allowances.</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:xliff-note="ACCOUNT_NUMBER, BANK_NAME" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">We confirm that his/her monthly salary will be transferred to his <xsl:value-of select=".//ACCOUNT_NUMBER" xdofo:field-name="ACCOUNT_NUMBER"/> with <xsl:value-of select=".//BANK_NAME" xdofo:field-name="BANK_NAME"/> effectively and undertake not to transfer his/her salary to any other bank unless he/she produces a clearance letter from you.</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">In case of his/her separation from the company we will inform you accordingly, and after recovering our dues, will transfer his/her end of service benefits to his/her account with your bank.</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:xliff-note="PERSON_NAME" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline xml:space="preserve" height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">This letter has been issued at <xsl:value-of select=".//PERSON_NAME" xdofo:field-name="PERSON_NAME"/>’s request and does not constitute any liability or guarantee on our part.</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt">Yours faithfully,</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt"/>
               <fo:block xdofo:tab-stops="left:36.0pt:space" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="50.05pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt" background-color="#ffff00">[Signatory]</fo:inline>
               </fo:block>
               <fo:block xdofo:tab-stops="left:36.0pt:space" linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="50.05pt" start-indent="5.4pt" padding-bottom="0.0pt" text-align="start" widows="2" height="0.0pt">
                  <fo:inline height="13.872pt" font-family="Calibri" white-space-collapse="false" font-size="12.0pt" background-color="#ffff00">[Business Title]</fo:inline>
               </fo:block>
               <fo:block linefeed-treatment="preserve" padding-top="0.0pt" orphans="2" end-indent="5.4pt" start-indent="5.4pt" padding-bottom="6.0pt" text-align="start" widows="2" font-family="Calibri" font-size="12.0pt" height="13.872pt">
                  <fo:inline id="{concat('page-total-', $_SECTION_NAME, $_XDOFOPOS)}"/>
                  <fo:inline id="{concat('page-total', $_XDOFOPOS)}"/>
               </fo:block>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
