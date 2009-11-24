From: Luca Altobelli <LUCA.ALTOBELLI@dimacosystems.com>
Date: Tue, 24 Nov 2009 11:45:21 +0100
Subject: [Buildroot] Problem using net-snmp and Buildroot
Message-ID: <4B0BB941.7090202@dimacosystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sirs
    I'm using buildroot-2009.08 and I need net-snmp (currently I'm using 
version 5.4.2.1) installed on my target system. When compiling no 
problem encountered but,  if I try to launch /snmpd/ on my target 
system, it gives the message "cannot find libc.so.6". I have libc.so.6 
on my host system, no trace of it on the target.
Attached is my Buildroot configuration.

Yours sincerely
Altobelli Luca.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091124/3fb95d96/attachment.htm>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091124/3fb95d96/attachment.diff>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: LUCA_ALTOBELLI.vcf
Type: text/x-vcard
Size: 344 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091124/3fb95d96/attachment.vcf>
