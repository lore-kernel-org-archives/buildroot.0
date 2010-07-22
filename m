From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Jul 2010 10:22:19 -0300
Subject: [Buildroot] [PATCHv2] Let busybox build system do it's magic on
	CFLAGS
Message-ID: <4C48460B.80304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, my git clone was busted, here goes again.
Fix busybox package to pass CFLAGS as make env rather than opt,
otherwise busybox's build system won't tweak them (which is a good thing).
Thanks to Thomas Petazzoni for noticing!
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-busybox-cflags.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100722/72a1e766/attachment.ksh>
