<?xml version = '1.0' encoding = 'utf-8'?>
<!-- $Header: TEMPLATE_XXSC_XXSCANA_ELEMENTS_en.xsl 115.0 2016/05/23 09:25:38 xdouser noship $ -->
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
            <fo:simple-page-master master-name="master0" margin-left="22.95pt" margin-right="22.95pt" page-height="841.9pt" page-width="595.3pt" margin-top="35.45pt" margin-bottom="35.45pt">
               <fo:region-before region-name="region-header" extent="21.25pt"/>
               <fo:region-body region-name="region-body" margin-top="21.25pt" margin-bottom="21.25pt"/>
               <fo:region-after region-name="region-footer" extent="21.25pt" display-align="after"/>
            </fo:simple-page-master>
         </fo:layout-master-set>
         <fo:page-sequence master-reference="master0">
            <fo:title>RTF Template</fo:title>
            <xsl:variable name="_PW" select="number(595.3)" xdofo:alt="internal"/>
            <xsl:variable name="_PH" select="number(841.9)" xdofo:alt="internal"/>
            <xsl:variable name="_ML" select="number(28.35)" xdofo:alt="internal"/>
            <xsl:variable name="_MR" select="number(28.35)" xdofo:alt="internal"/>
            <xsl:variable name="_MT" select="number(56.7)" xdofo:alt="internal"/>
            <xsl:variable name="_MB" select="number(56.7)" xdofo:alt="internal"/>
            <xsl:variable name="_HY" select="number(35.45)" xdofo:alt="internal"/>
            <xsl:variable name="_FY" select="number(35.45)" xdofo:alt="internal"/>
            <xsl:variable name="_SECTION_NAME" select="string('master0')" xdofo:alt="internal"/>
            <fo:static-content flow-name="region-header"/>
            <fo:static-content flow-name="region-footer"/>
            <fo:flow flow-name="region-body">
               <fo:block xdofo:line-spacing="multiple:13.8pt" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="5.4pt" text-align="start" padding-bottom="10.0pt" end-indent="5.4pt" padding-top="0.0pt"/>
               <xsl:variable name="_XDOFOOSTOTAL" select="(number(concat('0', $_XDOFOPOS2)) - 1) * number(concat('0', $_XDOFOTOTAL))"/>
               <xsl:for-each select=".//G_CLASSIFICATION_NAME">
                  <xsl:variable name="_XDOFOPOS" select="concat($_XDOFOPOS, '_', position())"/>
                  <xsl:variable name="_XDOFOPOS2" select="number(concat('0', $_XDOFOOSTOTAL)) + position()"/>
                  <fo:block xdofo:line-spacing="multiple:13.8pt" orphans="2" widows="2" linefeed-treatment="preserve" text-align="start" padding-bottom="0.25pt" end-indent="5.4pt" padding-top="1.125pt">
                     <fo:table start-indent="3.0pt" style-id="ts15" style-name="Table Grid" xdofo:align="start" xdofo:table-summary="Template Table 2" xdofo:row-header-count="0">
                        <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
                        <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
                        <fo:table-column column-width="262.3pt"/>
                        <fo:table-column column-width="7.4pt"/>
                        <fo:table-column column-width="269.4pt"/>
                        <fo:table-body>
                           <fo:table-row>
                              <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1" border-top="2.25pt solid #000000">
                                 <fo:block height="2.0pt"/>
                              </fo:table-cell>
                              <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="2">
                                 <fo:block height="16.0pt"/>
                              </fo:table-cell>
                           </fo:table-row>
                           <fo:table-row>
                              <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1">
                                 <fo:block xdofo:xliff-note="classification" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                    <fo:inline height="14.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="14.0pt" font-weight="bold">
                                       <xsl:value-of select=".//CLASSIFICATION_NAME" xdofo:field-name="CLASSIFICATION_NAME"/>
                                    </fo:inline>
                                 </fo:block>
                                 <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" font-family="Times New Roman" font-size="14.0pt" height="14.0pt"/>
                              </fo:table-cell>
                              <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="2">
                                 <fo:block height="16.0pt"/>
                              </fo:table-cell>
                           </fo:table-row>
                           <xsl:variable name="_XDOFOOSTOTAL" select="(number(concat('0', $_XDOFOPOS2)) - 1) * number(concat('0', $_XDOFOTOTAL))"/>
                           <xsl:variable name="_XDOFOTOTAL" select="count(.//G_1)"/>
                           <xsl:for-each select=".//G_1" xdofo:ctx="3">
                              <xsl:variable name="_XDOFOPOS" select="concat($_XDOFOPOS, '_', position())"/>
                              <xsl:variable name="_XDOFOPOS2" select="number(concat('0', $_XDOFOOSTOTAL)) + position()"/>
                              <fo:table-row xdofo:repeat="R">
                                 <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="2"/>
                                 <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1">
                                    <fo:block height="11.0pt"/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="2" border-bottom="0.25pt solid #000000">
                                    <fo:block height="11.0pt"/>
                                 </fo:table-cell>
                                 <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1" border-bottom="0.25pt solid #000000">
                                    <fo:block height="11.0pt"/>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.25pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Element Name</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.25pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="element" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">
                                          <xsl:value-of select=".//ELEMENT_NAME" xdofo:field-name="ELEMENT_NAME"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Processing Type</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="Procees type" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//DECODE_PETF_PROCESSING_TYPE_N_" xdofo:field-name="DECODE_PETF_PROCESSING_TYPE_N_"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Priority</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="priority" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//PROCESSING_PRIORITY" xdofo:field-name="PROCESSING_PRIORITY"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Multiple Entries Allowed</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="multiple" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//DECODE_PETF_MULTIPLE_ENTRIES_A" xdofo:field-name="DECODE_PETF_MULTIPLE_ENTRIES_A"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Process In Run</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="process" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//DECODE_PETF_PROCESS_IN_RUN_FLA" xdofo:field-name="DECODE_PETF_PROCESS_IN_RUN_FLA"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Indirect Result</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="indirect" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//DECODE_PETF_INDIRECT_ONLY_FLAG" xdofo:field-name="DECODE_PETF_INDIRECT_ONLY_FLAG"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="2" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt" background-color="#f2f2f2">
                                    <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Skip Rule</fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="1" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block xdofo:xliff-note="skip" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0.0pt">
                                       <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                          <xsl:value-of select=".//SKIP_RULE" xdofo:field-name="SKIP_RULE"/>
                                       </fo:inline>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                              <fo:table-row>
                                 <fo:table-cell padding-start="1.9pt" vertical-align="top" border-bottom="0.5pt solid #000000" border-end-color="#000000" padding-top="0.0pt" border-end-style="solid" border-start-color="#000000" padding-end="1.9pt" number-columns-spanned="3" border-top="0.5pt solid #000000" border-start-style="solid" height="0.0pt" border-end-width="0.5pt" padding-bottom="0.0pt" border-start-width="0.5pt">
                                    <fo:block padding-bottom="0.125pt" padding-top="0.0pt">
                                       <fo:table start-indent="0.0pt" style-id="ts15" style-name="Table Grid" xdofo:align="start" xdofo:table-summary="Template Table 1" xdofo:row-header-count="0">
                                          <xsl:variable name="_XDOFOPOS2" select="number(1)"/>
                                          <xsl:variable name="_XDOFOTOTAL" select="number(1)"/>
                                          <fo:table-column column-width="267.35pt"/>
                                          <fo:table-column column-width="267.45pt"/>
                                          <fo:table-body>
                                             <fo:table-row>
                                                <fo:table-cell padding-end="2.025pt" padding-bottom="0.0pt" padding-start="2.15pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1" border-bottom="0.25pt solid #000000" border-end-width="0.25pt" border-end-color="#000000" background-color="#f2f2f2" border-end-style="solid">
                                                   <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt">
                                                      <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt" font-weight="bold">Input Value</fo:inline>
                                                   </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding-end="2.15pt" padding-bottom="0.0pt" padding-start="2.025pt" padding-top="0.0pt" vertical-align="top" height="0.0pt" number-columns-spanned="1" border-bottom="0.25pt solid #000000" border-start-style="solid" border-start-color="#000000" border-start-width="0.25pt">
                                                   <xsl:variable name="_XDOFOOSTOTAL" select="(number(concat('0', $_XDOFOPOS2)) - 1) * number(concat('0', $_XDOFOTOTAL))"/>
                                                   <xsl:variable name="_XDOFOTOTAL" select="count(.//G_ELEMENT_NAME)"/>
                                                   <xsl:for-each select=".//G_ELEMENT_NAME" xdofo:ctx="3">
                                                      <xsl:variable name="_XDOFOPOS" select="concat($_XDOFOPOS, '_', position())"/>
                                                      <xsl:variable name="_XDOFOPOS2" select="number(concat('0', $_XDOFOOSTOTAL)) + position()"/>
                                                      <fo:block xdofo:xliff-note="F, input, e" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" height="0pt">
                                                         <fo:inline height="11.0pt" font-family="Times New Roman" white-space-collapse="false" font-size="11.0pt">
                                                            <xsl:value-of select=".//NAME" xdofo:field-name="NAME"/>
                                                         </fo:inline>
                                                      </fo:block>
                                                   </xsl:for-each>
                                                   <fo:block orphans="2" widows="2" linefeed-treatment="preserve" start-indent="0.0pt" text-align="start" padding-bottom="0.0pt" end-indent="0.0pt" padding-top="0.0pt" font-family="Times New Roman" font-size="11.0pt" height="11.0pt"/>
                                                </fo:table-cell>
                                             </fo:table-row>
                                          </fo:table-body>
                                       </fo:table>
                                    </fo:block>
                                 </fo:table-cell>
                              </fo:table-row>
                           </xsl:for-each>
                        </fo:table-body>
                     </fo:table>
                  </fo:block>
                  <fo:block xdofo:line-spacing="multiple:13.8pt" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="5.4pt" text-align="start" padding-bottom="10.0pt" end-indent="5.4pt" padding-top="0.0pt" font-family="Calibri" font-size="11.0pt" height="0.0pt"/>
               </xsl:for-each>
               <fo:block xdofo:line-spacing="multiple:13.8pt" orphans="2" widows="2" linefeed-treatment="preserve" start-indent="5.4pt" text-align="start" padding-bottom="10.0pt" end-indent="5.4pt" padding-top="0.0pt" font-family="Calibri" font-size="16.0pt" height="0.0pt">
                  <fo:inline id="{concat('page-total-', $_SECTION_NAME, $_XDOFOPOS)}"/>
                  <fo:inline id="{concat('page-total', $_XDOFOPOS)}"/>
               </fo:block>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>
</xsl:stylesheet>
