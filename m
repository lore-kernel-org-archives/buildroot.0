From: Robin Gilham <robin.gilham@gmail.com>
Date: Tue, 13 Jan 2009 13:25:04 +0200
Subject: [Buildroot] PATCH - fping, gSoap
Message-ID: <1231845905.7710.16.camel@Pandora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All, my first attempt at submitting a patch....


Fping - fping is a ping(1) like program which uses the Internet Control
Message Protocol (ICMP) echo request to determine if a host is up. fping
is different from ping in that you can specify any number of hosts on
the command line, or specify a file containing the lists of hosts to
ping. (http://fping.sourceforge.net/)

gSoap, - web services library, this patch only installs the libraries
onto the target and not the wsdl compiler and other tools.

A cross-platform open source C and C++ software development toolkit.
Generates C/C++ RPC code, XML data bindings, and efficient
schema-specific parsers for SOAP Web services and other applications
that benefit from an XML interface.
(http://www.cs.fsu.edu/~engelen/soap.html)



Hope you find this useful.

Regards
Robin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-avr32-v2.3.0-fping.patch
Type: text/x-patch
Size: 3029 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090113/b16fdd15/attachment-0002.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-avr32-v2.3.0-gsoap.patch
Type: text/x-patch
Size: 13270 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090113/b16fdd15/attachment-0003.bin 
