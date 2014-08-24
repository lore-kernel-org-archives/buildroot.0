From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 24 Aug 2014 10:40:39 +0300 (IDT)
Subject: [Buildroot] Phidgets library and web server?
Message-ID: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot colleagues,
I have integrated the Phidgets (http://www.phidgets.com/) 
libphidget-2.1.8.20140319 and phidgetwebservice into my Buildroot tracking 
branch.

I have tested on x86 and i.MX287.

The Phidgets software license is LGLP Version 3. No publicly accessible 
repo, just tarball downloads.

Uses autoconf build system.

Requires glibc and libusb.

From the Phidgets site:

"Phidgets are a set of user friendly building blocks for low cost USB 
sensing and control from your PC."

My client is using Phidgets products on a custom i.MX287 board rather 
than a PC, for control of a home kitchen and restaurant appliance using 
GPIO's and ADC's. I personally have no commercial interest in Phidgets.

I can commit to maintaining for six months on arm, x86 and ppc.

My question to you is, is this the type of package that we want to add to 
Buildroot? Should I submit patches? Or is there a "contrib" dir where I 
could put the patches?

Best regards,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
