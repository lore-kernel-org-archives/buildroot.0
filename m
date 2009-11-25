From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Nov 2009 11:11:13 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
In-Reply-To: <4B0BB941.7090202@dimacosystems.com> (Luca Altobelli's message of
	"Tue\, 24 Nov 2009 11\:45\:21 +0100")
References: <4B0BB941.7090202@dimacosystems.com>
Message-ID: <87iqcyc3su.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Altobelli <LUCA.ALTOBELLI@dimacosystems.com> writes:

 Luca> Dear Sirs
 Luca> ??? I'm using buildroot-2009.08 and I need net-snmp (currently I'm using
 Luca> version 5.4.2.1) installed on my target system. When compiling no problem
 Luca> encountered but,? if I try to launch snmpd on my target system, it gives the
 Luca> message "cannot find libc.so.6". I have libc.so.6 on my host system, no trace

I cannot reproduce it here with x86-64 (same as my host) or i386 with
2009.11-rc1. We did update the netsnmp package after 2009.08, could you
give 2009.11-rc1 a test?

-- 
Bye, Peter Korsgaard
