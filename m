From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2014 23:04:13 +0100
Subject: [Buildroot] [PATCH] snmppp: bump to version 3.3.3
In-Reply-To: <1391688387.362.5.camel@phoenix> (Axel Lin's message of "Thu, 06
 Feb 2014 20:06:27 +0800")
References: <1391688387.362.5.camel@phoenix>
Message-ID: <878utl45ya.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Changes snmp++v3.3.3
 > ====================

 > - Fixed: [APP-30] SNMP++ cannot BER decode Oids starting with 2 and
 >   with second sub-identifier >39 correctly.
 > - Fixed: [APP-31] SNMP++ does not encode Oids starting with 2 and
 >   second sub-ID greater than 47 correctly.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
