From: Paradoxxa2001 at web.de <Paradoxxa2001@web.de>
Date: Tue, 29 Apr 2008 11:12:56 +0200
Subject: [Buildroot] at91sam9263ek and at91bootstrap-2.4/2.3
Message-ID: <1144873254@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Today i figured out that when i use at91sam9263ek_defconfig with the Buidroot svn revision 21892 
i will get problems with the at91bootstrap-2.3 package because there is a define problem with 
CFG_DEBUG in drivers/debug.c. I found on ftp://www.at91.com/pub/buildroot/ a newer Version of 
at91bootstrap (2.4). I included this Version in the Buildroot Makefiles and now it works to compile it. 
I'm still waiting of my hardware, so i can't  check if it works. Maybe someone can do that?

Best Regards,
Thomas
_________________________________________________________________________
In 5 Schritten zur eigenen Homepage. Jetzt Domain sichern und gestalten! 
Nur 3,99 EUR/Monat! http://www.maildomain.web.de/?mc=021114
