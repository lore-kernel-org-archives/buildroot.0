From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 24 Apr 2009 19:03:23 +0200
Subject: [Buildroot] this may be a bug in busybox
Message-ID: <4B27817CD25E4E418A227BED51393574@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi
 
in busybox 1.14.0
 
# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         1.1.168.192.in- 0.0.0.0         UG    0      0        0 eth0
#


1.1.168.192 should be 192.168.1.1

Anyone else noticed this ?
Johan
