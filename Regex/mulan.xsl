<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Identity template to copy everything by default -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Tag Speaker Names using xsl:analyze-string -->
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="^([A-Z][a-z]+(?:\s[A-Z][a-z]+)*)\s*:">
            <xsl:matching-substring>
                <speaker><xsl:value-of select="regex-group(1)"/></speaker>:
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

    <!-- Convert empty <sp> elements to <note> -->
    <xsl:template match="sp[not(*)]">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>

</xsl:stylesheet>
