<?xml version = '1.0' encoding = 'utf-8'?>
<!-- $Header: TEMPLATE_XXSC_XXSCHRANA_SCNW_en.xsl 115.0 2016/05/23 09:25:39 xdouser noship $ -->
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
         <!--Render: PAY MODE-->
         <xsl:call-template name="L1R1P2S0"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P2S0'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S1"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S1'))"/>
         <!--Render: BENEFICIARY NAME-->
         <xsl:call-template name="L1R1P60S2"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P60S2'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S3"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S3'))"/>
         <!--Render: CURRENCY-->
         <xsl:call-template name="L1R1P3S4"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S4'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S5"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S5'))"/>
         <!--Render: IBAN-->
         <xsl:call-template name="L1R1P23S6"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P23S6'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S7"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S7'))"/>
         <!--Render: BENEFICIARY BANK CODE-->
         <xsl:call-template name="L1R1P4S8"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P4S8'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S9"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S9'))"/>
         <!--Render: PAYMENT DETAIL-->
         <xsl:call-template name="L1R1P70S10"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P70S10'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S11"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S11'))"/>
         <!--Render: NET PAY-->
         <xsl:call-template name="L1R1P15S12"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P15S12'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S13"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S13'))"/>
         <!--Render: TRANSACTION TYPE-->
         <xsl:call-template name="L1R1P3S14"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P3S14'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S15"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S15'))"/>
         <!--Render: PAYMENT TYPE-->
         <xsl:call-template name="L1R1P5S16"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P5S16'))"/>
         <!--Render: -->
         <xsl:call-template name="L1R1P1S17"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S17'))"/>
         <!--Render: CHARGE TYPE-->
         <xsl:call-template name="L1R1P1S18"/>
         <xsl:value-of select="xdoxslt:append_to($_XDOCTX, 'L1R1', xdoxslt:get_variable($_XDOCTX, 'L1R1P1S18'))"/>
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
   <xsl:template name="L1R1P2S0">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((PAY_MODE)),'NONE')-->
      <xsl:variable name="v1" select="string(xdoxslt:normalize_string($_XDOCTX, .//PAY_MODE))"/>
      <xsl:variable name="v2" select="xdoxslt:convert_case(string($v1), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v2))>2">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v3', substring(string($v2), 1,2))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v3', $v2)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P2S0', xdoxslt:get_variable($_XDOCTX, '$v3'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S1">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v4" select="string(',')"/>
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
   <xsl:template name="L1R1P60S2">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((BENIFICIARY_NAME)),'NONE')-->
      <xsl:variable name="v7" select="string(xdoxslt:normalize_string($_XDOCTX, .//BENIFICIARY_NAME))"/>
      <xsl:variable name="v8" select="xdoxslt:convert_case(string($v7), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v8))>60">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v9', substring(string($v8), 1,60))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v9', $v8)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P60S2', xdoxslt:get_variable($_XDOCTX, '$v9'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S3">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v10" select="string(',')"/>
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
   <xsl:template name="L1R1P3S4">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((CURRENCY1)),'NONE')-->
      <xsl:variable name="v13" select="string(xdoxslt:normalize_string($_XDOCTX, .//CURRENCY1))"/>
      <xsl:variable name="v14" select="xdoxslt:convert_case(string($v13), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v14))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v15', substring(string($v14), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v15', $v14)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S4', xdoxslt:get_variable($_XDOCTX, '$v15'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S5">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v16" select="string(',')"/>
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
   <xsl:template name="L1R1P23S6">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((IBAN)),'NONE')-->
      <xsl:variable name="v19" select="string(xdoxslt:normalize_string($_XDOCTX, .//IBAN))"/>
      <xsl:variable name="v20" select="xdoxslt:convert_case(string($v19), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v20))>23">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v21', substring(string($v20), 1,23))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v21', $v20)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P23S6', xdoxslt:get_variable($_XDOCTX, '$v21'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S7">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v22" select="string(',')"/>
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
   <xsl:template name="L1R1P4S8">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((BENFICIARY_BANK_CODE)),'NONE')-->
      <xsl:variable name="v25" select="string(xdoxslt:normalize_string($_XDOCTX, .//BENFICIARY_BANK_CODE))"/>
      <xsl:variable name="v26" select="xdoxslt:convert_case(string($v25), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v26))>4">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v27', substring(string($v26), 1,4))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v27', $v26)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P4S8', xdoxslt:get_variable($_XDOCTX, '$v27'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S9">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v28" select="string(',')"/>
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
   <xsl:template name="L1R1P70S10">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((PAYMENT_DETAIL)),'NONE')-->
      <xsl:variable name="v31" select="string(xdoxslt:normalize_string($_XDOCTX, .//PAYMENT_DETAIL))"/>
      <xsl:variable name="v32" select="xdoxslt:convert_case(string($v31), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v32))>70">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v33', substring(string($v32), 1,70))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v33', $v32)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P70S10', xdoxslt:get_variable($_XDOCTX, '$v33'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S11">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v34" select="string(',')"/>
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
   <xsl:template name="L1R1P15S12">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: TO_NUMBER((NET_PAY))-->
      <xsl:variable name="v37" select="xdoxslt:to_number(xdoxslt:normalize_string($_XDOCTX, .//NET_PAY))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v37))>15">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v38', substring(string($v37), 1,15))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v38', $v37)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P15S12', xdoxslt:get_variable($_XDOCTX, '$v38'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S13">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v39" select="string(',')"/>
      <xsl:variable name="v40" select="xdoxslt:convert_case(string($v39), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v40))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v41', substring(string($v40), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v41', $v40)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S13', xdoxslt:get_variable($_XDOCTX, '$v41'))"/>
   </xsl:template>
   <xsl:template name="L1R1P3S14">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((TRANSACTION_TYPE)),'NONE')-->
      <xsl:variable name="v42" select="string(xdoxslt:normalize_string($_XDOCTX, .//TRANSACTION_TYPE))"/>
      <xsl:variable name="v43" select="xdoxslt:convert_case(string($v42), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v43))>3">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v44', substring(string($v43), 1,3))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v44', $v43)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P3S14', xdoxslt:get_variable($_XDOCTX, '$v44'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S15">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v45" select="string(',')"/>
      <xsl:variable name="v46" select="xdoxslt:convert_case(string($v45), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v46))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v47', substring(string($v46), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v47', $v46)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S15', xdoxslt:get_variable($_XDOCTX, '$v47'))"/>
   </xsl:template>
   <xsl:template name="L1R1P5S16">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((PAYMENT_TYPE)),'NONE')-->
      <xsl:variable name="v48" select="string(xdoxslt:normalize_string($_XDOCTX, .//PAYMENT_TYPE))"/>
      <xsl:variable name="v49" select="xdoxslt:convert_case(string($v48), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v49))>5">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v50', substring(string($v49), 1,5))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v50', $v49)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P5S16', xdoxslt:get_variable($_XDOCTX, '$v50'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S17">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: CONVERT_CASE(TO_CHAR((',')),'NONE')-->
      <xsl:variable name="v51" select="string(',')"/>
      <xsl:variable name="v52" select="xdoxslt:convert_case(string($v51), string('NONE'))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v52))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v53', substring(string($v52), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v53', $v52)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S17', xdoxslt:get_variable($_XDOCTX, '$v53'))"/>
   </xsl:template>
   <xsl:template name="L1R1P1S18">
      <xsl:param name="index" select="string(position())"/>
      <!--Expression: TO_NUMBER((CHARGE_TYPE))-->
      <xsl:variable name="v54" select="xdoxslt:to_number(xdoxslt:normalize_string($_XDOCTX, .//CHARGE_TYPE))"/>
      <xsl:choose>
         <xsl:when test="string-length(string($v54))>1">
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v55', substring(string($v54), 1,1))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xdoxslt:set_variable($_XDOCTX,'$v55', $v54)"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="xdoxslt:set_variable($_XDOCTX, 'L1R1P1S18', xdoxslt:get_variable($_XDOCTX, '$v55'))"/>
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
