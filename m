From: gpontis at spamcop.net <gpontis@spamcop.net>
Date: Thu, 20 Jun 2013 09:10:50 -0700
Subject: [Buildroot] Xenomai package not extracted in time
Message-ID: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working with buildroot 2013.05, ARM, and Xenomai 2.6.2.1. As part of
making Xenomai go, there is a kernel patch. I keep that patch under my board
directory and point to it with BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH. The
build is failing because a script (from Xenomai) that is used to apply this
patch is not available. It is not available because the Xenomai package has
not been extracted yet. If I manually extract the Xenomai package once then
all goes ahead smoothly. A few versions back of Xenomai and buildroot, this
worked automatically. I don't know if I broke something or if the BR
environment has somehow changed. But can someone offer guidance on how to
fix it so he manual step is not necessary ?

 

TIA

 

Geo. 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/9286a306/attachment.html>
