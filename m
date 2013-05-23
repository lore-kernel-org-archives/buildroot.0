From: Morten Kvistgaard <MK@pch-engineering.dk>
Date: Thu, 23 May 2013 14:53:15 +0200
Subject: [Buildroot] How to include Buildroot defines?
Message-ID: <0855BDD4CF82174A8BE362DE9F27C3BF01E3FEC82D23@pche-exchange>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm currently converting my uClinux to Buildroot.

In my uClinux I could include the "KConfig result" in my programs. That way I could customize a program in the menuconfig. Eg. with extra options or by including apps etc. This could look something like:

#include <config/autoconf.h>

#ifdef CONFIG_USER_MYAPP_OPTION
   //Menuconfig tells me to build featureX
#endif


This was an easy way to handle static options.
I can see that Buildroot also has a autoconf.h. It's located in output/build/buildroot-config/.

How do I include this in a correct way? Or is this a bad way to do it?

Regards,
Morten Kvistgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130523/e7097416/attachment.html>
