From: Simon Pasch <fpasch@googlemail.com>
Date: Mon, 22 Dec 2008 12:03:44 +0100
Subject: [Buildroot] Alsa-Utils need xmlto-command on host -> Patch
In-Reply-To: <f90898420812220249t66145b04n90d336ca7dbfc9@mail.gmail.com>
References: <f90898420812220249t66145b04n90d336ca7dbfc9@mail.gmail.com>
Message-ID: <f90898420812220303q35376833oabe59bf7997901b9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building alsactl from alsa-utils-package fails, if xmlto isn't
available on host.

This patch removes xmlto-dependency, by removing man-page generation
in alsactl-Makefile.


Simon Pasch
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa-utils-1.0.18-remove_xmlto_dep.patch
Type: text/x-diff
Size: 1314 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081222/4166389b/attachment.bin 
