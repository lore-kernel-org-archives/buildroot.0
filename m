From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 22 Oct 2009 12:09:39 +0200
Subject: [Buildroot] [RFC] Don't hide all editors in menuconfig
Message-ID: <4AE02F63.8080302@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I probably misunderstood the use of BR2_PACKAGE_BUSYBOX_SHOW_OTHERS but
I'm in a case where I have to hide packages provided by Busybox and use
Nano as editor.

So here is a patch I have to apply to show Nano again in Buildroot's
menuconfig.
Am I right ?

Regards,
Julien

-------------- next part --------------
A non-text attachment was scrubbed...
Name: Dont-hide-all-editors.patch
Type: text/x-diff
Size: 1165 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091022/0c203a8d/attachment.bin>
