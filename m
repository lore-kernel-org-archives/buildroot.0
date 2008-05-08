From: Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>
Date: Thu, 8 May 2008 14:01:15 +0100
Subject: [Buildroot] make clean;make fails
Message-ID: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1FE@srv02.nortechonline.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi There,

I'm trying to remove some packages from my buildroot to free up some diskspace.

First, I noticed if I do 'make menuconfig' remove the packages then 'make' they don't actually get removed from the rootfs disk image.

So then I thought I'd try 'make clean', 'make' but it would appear this doesn't put all the necessary stuff into project_build_arm/at91sam9260dfc/root/ (e.g. /usr/bin directory is missing, /etc/shadow file is missing amongst others)

Is this is bug in the buildroot system, or something I'm doing wrong?

Thanks


Simon
