From: Simon Pasch <fpasch@googlemail.com>
Date: Mon, 22 Dec 2008 12:23:39 +0100
Subject: [Buildroot] Remove SUSv3 legacy stuff from alsa-utils
Message-ID: <f90898420812220323r1fb28fcdx7083c925f2689389@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alsactl doesn't compile, if UCLIBC_SUSV3_LEGACY_MACROS isn't set in
uclibc-config.

I think the cleanest way is to remove SUSv3-stuff from alsa-utils (see
attached patch)

Simon Pasch
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa-utils-1.0.18-susv3-legacy.patch
Type: text/x-diff
Size: 691 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081222/196268d9/attachment.bin 
