<?xml version = '1.0' encoding = 'utf-8'?>
<!-- $Header: TEMPLATE_XXSC_XXSCHRANA_NWPS_en.xsl 115.0 2016/05/23 09:25:39 xdouser noship $ -->
<!-- dbdrv: none -->

<!--Generated by Oracle BI Publisher 10.1.3.4.2-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:ora="http://www.oracle.com/XSL/Transform/java/" xmlns:xdofo="http://xmlns.oracle.com/oxp/fo/extensions" xmlns:xdoxslt="http://www.oracle.com/XSL/Transform/java/oracle.apps.xdo.template.rtf.XSLTFunctions" xmlns:xdoxliff="urn:oasis:names:tc:xliff:document:1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:OutBoundPayments="http://xmlns.oracle.com/iby/EFTTemplateSample" xmlns:General="http://xmlns.oracle.com/iby" xmlns:Address="http://xmlns.oracle.com/iby/address" xmlns:PaymentsCommon="http://xmlns.oracle.com/iby/PaymentsCommon" xmlns:xdoeft="http://xmlns.oracle.com/iby/xdoeft">
   <xsl:output method="text" encoding="iso-8859-1"/>
   <xsl:param name="_XDOCTX">#</xsl:param>
   <xsl:decimal-format name="_DECIMALFORMAT" grouping-separator="," decimal-separator="."/>
   <xsl:template match="/">
      <!--Startup: Init Record Counters-->
      <xsl:call-template name="_RECORDCOUNTER"/>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'MESSAGE', string(''))"/>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'MESSAGETEMPLATES', string(''))"/>
      <!--Control: ================ Start new level: G_ROWNUM=================-->
      <xsl:for-each select=".//G_ROWNUM" xdoeft:type="LEVEL" xdoeft:level-name="G_ROWNUM">
         <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1',  string(''))"/>
         <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1L',  number(0))"/>
         <!--Control: ===== START RECORD: Bank Details =====-->
         <!--Render: CORPORATE REF NO-->
         <xsl:call-template name="L1R1P13S0"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P13S0'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S1"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S1'))"/>
         <!--Render: PAY MODE-->
         <xsl:call-template name="L1R1P3S2"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S2'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S3"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S3'))"/>
         <!--Render: BENEFICIARY NAME-->
         <xsl:call-template name="L1R1P23S4"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P23S4'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S5"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S5'))"/>
         <!--Render: CURRENCY-->
         <xsl:call-template name="L1R1P15S6"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P15S6'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S7"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S7'))"/>
         <!--Render: IBAN-->
         <xsl:call-template name="L1R1P3S8"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S8'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S9"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S9'))"/>
         <!--Render: BENEFICIARY BANK CODE-->
         <xsl:call-template name="L1R1P10S10"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P10S10'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S11"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S11'))"/>
         <!--Render: PAYMENT DETAIL-->
         <xsl:call-template name="L1R1P70S12"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P70S12'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S13"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S13'))"/>
         <!--Render: NET PAY-->
         <xsl:call-template name="L1R1P15S14"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P15S14'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S15"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S15'))"/>
         <!--Render: TRANSACTION TYPE-->
         <xsl:call-template name="L1R1P24S16"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P24S16'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S17"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S17'))"/>
         <!--Render: PAYMENT TYPE-->
         <xsl:call-template name="L1R1P5S18"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P5S18'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S19"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S19'))"/>
         <!--Render: CHARGE TYPE-->
         <xsl:call-template name="L1R1P40S20"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P40S20'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S21"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S21'))"/>
         <!--Render: CHARGE-->
         <xsl:call-template name="L1R1P3S22"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S22'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S23"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S23'))"/>
         <!--Render: REMITTANCE CODE-->
         <xsl:call-template name="L1R1P3S24"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S24'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S25"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S25'))"/>
         <!--Render: REMITTANCE_DETAIL-->
         <xsl:call-template name="L1R1P3S26"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S26'))"/>
         <xsl:value-of select="xdoxslt:get_variable($_XDOCTX, 'L1R1')"/>
         <!--Control: ===== END RECORD: Bank Details =====-->
         <!--Control: ===== Record Break =====-->
         <xsl:call-template name="_RECORDBREAK"/>
         <!--Control: Increase record counter: Bank Details-->
         <xsl:value-of select="xdoxslt:next_sequence_number($_XDOCTX, 'Bank Details_RC')"/>
      </xsl:for-each>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'MESSAGE1', xdoxslt:removeAll(string(xdoxslt:get_variable($_XDOCTX, 'MESSAGETEMPLATES')), string(xdoxslt:get_variable($_XDOCTX, 'MESSAGE'))))"/>
      <xsl:variable name="MESSAGELENGTH" select="string-length(xdoxslt:get_variable($_XDOCTX, 'MESSAGE1'))"/>
      <xsl:value-of select="xdoxslt:get_variable($_XDOCTX, 'MESSAGE')"/>
   </xsl:template>
   <xsl:template name="_RECORDCOUNTER">
      <!--Record Counter Init-->
      <!--Definition: Bank Details_RC-->
      <xsl:call-template name="SEQ_START_Bank Details_RC"/>
      <xsl:value-of select="xdoxslt:create_sequence_number($_XDOCTX, string('Bank Details_RC'), number(1), number(999999), xdoxslt:get_variable($_XDOCTX, 'SEQ_START_Bank Details_RC_V'), number(1))"/>
   </xsl:template>
   <xsl:template name="SEQ_START_Bank Details_RC">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: 0-->
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'SEQ_START_Bank Details_RC_V', 0)"/>
   </xsl:template>
   <xsl:template name="L1R1P13S0">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CF_ROWNUM)),'NONE')-->
      <xsl:variable name="v1" select="string(xdoxslt:normalize_string($_XDOCTX, .//CF_ROWNUM))"/>
      <xsl:variable name="v2" select="xdoxslt:convert_case(string($v1), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v2))>13">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v3', substring(string($v2), 1,13))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v3', $v2)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P13S0', xdoxslt:get_variable($_XDOCTX, '$v3'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S1">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v4" select="string(';')"/>
      <xsl:variable name="v5" select="xdoxslt:convert_case(string($v4), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v5))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v6', substring(string($v5), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v6', $v5)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S1', xdoxslt:get_variable($_XDOCTX, '$v6'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S2">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CST)),'NONE')-->
      <xsl:variable name="v7" select="string(xdoxslt:normalize_string($_XDOCTX, .//CST))"/>
      <xsl:variable name="v8" select="xdoxslt:convert_case(string($v7), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v8))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v9', substring(string($v8), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v9', $v8)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S2', xdoxslt:get_variable($_XDOCTX, '$v9'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S3">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v10" select="string(';')"/>
      <xsl:variable name="v11" select="xdoxslt:convert_case(string($v10), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v11))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v12', substring(string($v11), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v12', $v11)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S3', xdoxslt:get_variable($_XDOCTX, '$v12'))"/>
   </xsl:template>
   <xsl:template name="L1R1P23S4">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((COMPANY)),'NONE')-->
      <xsl:variable name="v13" select="string(xdoxslt:normalize_string($_XDOCTX, .//COMPANY))"/>
      <xsl:variable name="v14" select="xdoxslt:convert_case(string($v13), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v14))>23">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v15', substring(string($v14), 1,23))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v15', $v14)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P23S4', xdoxslt:get_variable($_XDOCTX, '$v15'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S5">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v16" select="string(';')"/>
      <xsl:variable name="v17" select="xdoxslt:convert_case(string($v16), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v17))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v18', substring(string($v17), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v18', $v17)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S5', xdoxslt:get_variable($_XDOCTX, '$v18'))"/>
   </xsl:template>
   <xsl:template name="L1R1P15S6">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CF_SALARY)),'NONE')-->
      <xsl:variable name="v19" select="string(xdoxslt:normalize_string($_XDOCTX, .//CF_SALARY))"/>
      <xsl:variable name="v20" select="xdoxslt:convert_case(string($v19), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v20))>15">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v21', substring(string($v20), 1,15))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v21', $v20)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P15S6', xdoxslt:get_variable($_XDOCTX, '$v21'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S7">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v22" select="string(';')"/>
      <xsl:variable name="v23" select="xdoxslt:convert_case(string($v22), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v23))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v24', substring(string($v23), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v24', $v23)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S7', xdoxslt:get_variable($_XDOCTX, '$v24'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S8">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CURRENCY1)),'NONE')-->
      <xsl:variable name="v25" select="string(xdoxslt:normalize_string($_XDOCTX, .//CURRENCY1))"/>
      <xsl:variable name="v26" select="xdoxslt:convert_case(string($v25), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v26))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v27', substring(string($v26), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v27', $v26)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S8', xdoxslt:get_variable($_XDOCTX, '$v27'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S9">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v28" select="string(';')"/>
      <xsl:variable name="v29" select="xdoxslt:convert_case(string($v28), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v29))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v30', substring(string($v29), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v30', $v29)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S9', xdoxslt:get_variable($_XDOCTX, '$v30'))"/>
   </xsl:template>
   <xsl:template name="L1R1P10S10">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((PAYDATE)),'NONE')-->
      <xsl:variable name="v31" select="string(xdoxslt:normalize_string($_XDOCTX, .//PAYDATE))"/>
      <xsl:variable name="v32" select="xdoxslt:convert_case(string($v31), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v32))>10">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v33', substring(string($v32), 1,10))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v33', $v32)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P10S10', xdoxslt:get_variable($_XDOCTX, '$v33'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S11">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v34" select="string(';')"/>
      <xsl:variable name="v35" select="xdoxslt:convert_case(string($v34), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v35))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v36', substring(string($v35), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v36', $v35)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S11', xdoxslt:get_variable($_XDOCTX, '$v36'))"/>
   </xsl:template>
   <xsl:template name="L1R1P70S12">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((BENIFICIARY_NAME)),'NONE')-->
      <xsl:variable name="v37" select="string(xdoxslt:normalize_string($_XDOCTX, .//BENIFICIARY_NAME))"/>
      <xsl:variable name="v38" select="xdoxslt:convert_case(string($v37), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v38))>70">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v39', substring(string($v38), 1,70))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v39', $v38)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P70S12', xdoxslt:get_variable($_XDOCTX, '$v39'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S13">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v40" select="string(';')"/>
      <xsl:variable name="v41" select="xdoxslt:convert_case(string($v40), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v41))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v42', substring(string($v41), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v42', $v41)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S13', xdoxslt:get_variable($_XDOCTX, '$v42'))"/>
   </xsl:template>
   <xsl:template name="L1R1P15S14">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((EMPLOYEE_ADDRESS)),'NONE')-->
      <xsl:variable name="v43" select="string(xdoxslt:normalize_string($_XDOCTX, .//EMPLOYEE_ADDRESS))"/>
      <xsl:variable name="v44" select="xdoxslt:convert_case(string($v43), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v44))>15">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v45', substring(string($v44), 1,15))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v45', $v44)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P15S14', xdoxslt:get_variable($_XDOCTX, '$v45'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S15">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v46" select="string(';')"/>
      <xsl:variable name="v47" select="xdoxslt:convert_case(string($v46), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v47))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v48', substring(string($v47), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v48', $v47)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S15', xdoxslt:get_variable($_XDOCTX, '$v48'))"/>
   </xsl:template>
   <xsl:template name="L1R1P24S16">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((IBAN)),'NONE')-->
      <xsl:variable name="v49" select="string(xdoxslt:normalize_string($_XDOCTX, .//IBAN))"/>
      <xsl:variable name="v50" select="xdoxslt:convert_case(string($v49), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v50))>24">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v51', substring(string($v50), 1,24))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v51', $v50)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P24S16', xdoxslt:get_variable($_XDOCTX, '$v51'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S17">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v52" select="string(';')"/>
      <xsl:variable name="v53" select="xdoxslt:convert_case(string($v52), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v53))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v54', substring(string($v53), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v54', $v53)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S17', xdoxslt:get_variable($_XDOCTX, '$v54'))"/>
   </xsl:template>
   <xsl:template name="L1R1P5S18">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((ADDRESS_COMPANY_BANK)),'NONE')-->
      <xsl:variable name="v55" select="string(xdoxslt:normalize_string($_XDOCTX, .//ADDRESS_COMPANY_BANK))"/>
      <xsl:variable name="v56" select="xdoxslt:convert_case(string($v55), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v56))>5">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v57', substring(string($v56), 1,5))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v57', $v56)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P5S18', xdoxslt:get_variable($_XDOCTX, '$v57'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S19">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v58" select="string(';')"/>
      <xsl:variable name="v59" select="xdoxslt:convert_case(string($v58), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v59))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v60', substring(string($v59), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v60', $v59)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S19', xdoxslt:get_variable($_XDOCTX, '$v60'))"/>
   </xsl:template>
   <xsl:template name="L1R1P40S20">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((PAYMENT_DETAIL)),'NONE')-->
      <xsl:variable name="v61" select="string(xdoxslt:normalize_string($_XDOCTX, .//PAYMENT_DETAIL))"/>
      <xsl:variable name="v62" select="xdoxslt:convert_case(string($v61), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v62))>40">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v63', substring(string($v62), 1,40))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v63', $v62)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P40S20', xdoxslt:get_variable($_XDOCTX, '$v63'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S21">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v64" select="string(';')"/>
      <xsl:variable name="v65" select="xdoxslt:convert_case(string($v64), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v65))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v66', substring(string($v65), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v66', $v65)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S21', xdoxslt:get_variable($_XDOCTX, '$v66'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S22">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CHARGE)),'NONE')-->
      <xsl:variable name="v67" select="string(xdoxslt:normalize_string($_XDOCTX, .//CHARGE))"/>
      <xsl:variable name="v68" select="xdoxslt:convert_case(string($v67), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v68))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v69', substring(string($v68), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v69', $v68)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S22', xdoxslt:get_variable($_XDOCTX, '$v69'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S23">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v70" select="string(';')"/>
      <xsl:variable name="v71" select="xdoxslt:convert_case(string($v70), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v71))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v72', substring(string($v71), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v72', $v71)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S23', xdoxslt:get_variable($_XDOCTX, '$v72'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S24">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((REMITTANCE_CODE)),'NONE')-->
      <xsl:variable name="v73" select="string(xdoxslt:normalize_string($_XDOCTX, .//REMITTANCE_CODE))"/>
      <xsl:variable name="v74" select="xdoxslt:convert_case(string($v73), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v74))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v75', substring(string($v74), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v75', $v74)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S24', xdoxslt:get_variable($_XDOCTX, '$v75'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S25">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((';')),'NONE')-->
      <xsl:variable name="v76" select="string(';')"/>
      <xsl:variable name="v77" select="xdoxslt:convert_case(string($v76), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v77))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v78', substring(string($v77), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v78', $v77)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S25', xdoxslt:get_variable($_XDOCTX, '$v78'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S26">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((REMITTANCE_DETAIL)),'NONE')-->
      <xsl:variable name="v79" select="string(xdoxslt:normalize_string($_XDOCTX, .//REMITTANCE_DETAIL))"/>
      <xsl:variable name="v80" select="xdoxslt:convert_case(string($v79), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v80))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v81', substring(string($v80), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v81', $v80)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S26', xdoxslt:get_variable($_XDOCTX, '$v81'))"/>
   </xsl:template>
   <xsl:template name="_RECORDBREAK">
      <!--Record Break-->
      <xsl:variable name="RECORDBREAK" select="concat(xdoxslt:chr(13), xdoxslt:chr(10))"/>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'RECORD_BREAK_LENGTH',string-length($RECORDBREAK))"/>
      <xsl:value-of select="string($RECORDBREAK)"/>
   </xsl:template>
   <xsl:template name="_BLOCK_FILLER">
      <!--Block Filler-->
      <xsl:param name="BLOCK_BEGIN"/>
      <xsl:param name="BLOCK_END"/>
      <xsl:param name="BLOCK_SPAN"/>
      <xsl:param name="BLOCK_FILL_CHAR"/>
      <xsl:param name="BLOCK_RECORD_LENGTH"/>
      <xsl:param name="RECORD_BREAK_LENGTH"/>
      <xsl:param name="BLOCK_RECORD_COUNTER"/>
      <xsl:if test="number(string-length($BLOCK_END) - string-length($BLOCK_BEGIN) - number($BLOCK_RECORD_COUNTER) * number($RECORD_BREAK_LENGTH)) mod (number($BLOCK_SPAN) * number($BLOCK_RECORD_LENGTH)) > 0">
         <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'MESSAGE', xdoxslt:fill_block($BLOCK_END, $BLOCK_FILL_CHAR, $BLOCK_RECORD_LENGTH))"/>
         <xsl:call-template name="_RECORDBREAK"/>
         <xsl:call-template name="_BLOCK_FILLER">
            <xsl:with-param name="BLOCK_BEGIN" select="string($BLOCK_BEGIN)"/>
            <xsl:with-param name="BLOCK_END" select="string(xdoxslt:get_variable($_XDOCTX, 'MESSAGE'))"/>
            <xsl:with-param name="BLOCK_SPAN" select="$BLOCK_SPAN"/>
            <xsl:with-param name="BLOCK_FILL_CHAR" select="$BLOCK_FILL_CHAR"/>
            <xsl:with-param name="BLOCK_RECORD_LENGTH" select="$BLOCK_RECORD_LENGTH"/>
            <xsl:with-param name="RECORD_BREAK_LENGTH" select="$RECORD_BREAK_LENGTH"/>
            <xsl:with-param name="BLOCK_RECORD_COUNTER" select="number($BLOCK_RECORD_COUNTER) + number(1)"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>
