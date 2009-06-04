From: Berns <Berns@BEKA-Elektronik.de>
Date: Thu, 4 Jun 2009 09:54:46 +0200
Subject: [Buildroot] uclibc locale
Message-ID: <NDBBKLDECLOIHFJKBINAIEBPEIAA.Berns@BEKA-Elektronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i try to build buildoot with the latest git revision. My configuration based
on at91sam9263ek_defconfig and I have added X11.
When i activate "use pregenerated locale data" the build process trys to
load a file "uClibc-locale-20081111-32-el.tgz" which doesn't exist at
www.uclibc.org.
After changing the entry in ../uClibc-0-9.30.1/extra/localMakefile.in to
uClibc-locale-030818.tgz, i'am able to build the root file system.
The additional items "Purge unwanted locale data" and "Locales to keep"
should only appear when "Use pregenerated locale data" is activated or ?


Regards

Rainer
