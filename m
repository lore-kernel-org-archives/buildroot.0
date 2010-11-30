From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Tue, 30 Nov 2010 11:57:17 +0100
Subject: [Buildroot] init script for portmap
Message-ID: <4CF4D88D.3090305@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The init script for portmap will not be installed on target after the 
update to version 6.0 and converting to autotargets. As the init script 
is still available I'm wondering if this is only a mistake ?

The following line is missing in portmap.mk

$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d

Regards

Patrick

-- 

Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:	+49 631 3724 5526
Mail:	patrick.ziegler at fh-kl.de

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
