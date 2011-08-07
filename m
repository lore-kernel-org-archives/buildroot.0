From: Bernhard Roth <broth@roth-itk.de>
Date: Sun, 07 Aug 2011 13:10:55 +0200
Subject: [Buildroot] Adding libev to buildroot
Message-ID: <4E3E72BF.9040302@roth-itk.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am using buildroot for a while now and I always have to add the libev 
library for my projects. Libev is a lightweight and powerful alternative 
to livevent.
Maybe it's possible to add libev support to the next official version of 
buildroot.

Attached I send you the package config files for libev which I use 
(based on libevent files)
Please put them into package/libev.

Finally following line has to be added to package/Config.in just after 
libevent

source "package/libev/Config.in"

Best regards,

Bernhard Roth

-- 
____________________________________
Roth ITK Consulting GmbH
Landsberger Str. 398
81241 M?nchen
Germany

Fon: +49 89 461317-0
Fax: +49 89 461317-29
Email: broth at roth-itk.de
Web: http://www.roth-itk.de/

Gesch?ftsf?hrer: Bernhard Roth
HRB 174971, Amtsgericht M?nchen
UID: DE 261 708 872
____________________________________


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110807/7726e19d/attachment.in>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libev.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110807/7726e19d/attachment.ksh>
