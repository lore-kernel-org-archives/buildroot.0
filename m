From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jan 2015 19:22:35 +0100
Subject: [Buildroot] [PATCH V2] dvd+rw-tools: new package
References: <54B9B774.9030204@ou.edu>
Message-ID: <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Steve Kenton <skenton@ou.edu> wrote in 
news:54B9B774.9030204 at ou.edu:

> +     $(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
> +endef

Hi,

according to Beyond Linux From Scratch you need libisoburn or a similar 
package which provides xorrisofs, otherwise "the growisofs command will not 
function properly"
http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html

Did your package work without xorrisofs during your tests?

Regards, Bernd
