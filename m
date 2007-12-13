From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 13 Dec 2007 20:54:11 +0100
Subject: [Buildroot] BR2_PACKAGE_LINUX_KCONFIG question
References: <5970ab460712131121n7ee4357cl89d769320f2e2a81@mail.gmail.com>
Message-ID: <028101c83dd2$66ac6620$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>I can't get buildroot to complete and BR2_PACKAGE_LINUX_KCONFIG was pointed
> out as the culprit.  It was not set.  I followed the setup instructions on
> the buildroot website but nothing was mentioned about this variable and I
> can't find it when I do a "make menuconfig".  What do I need to set this
> variable to?
> 


grep -r BR2_PACKAGE_LINUX_KCONFIG target

should give you some clues in which Config.in it is defined.


Best Regards
Ulf Samuelsson
