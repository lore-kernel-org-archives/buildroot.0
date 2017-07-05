From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 5 Jul 2017 23:31:42 +0200
Subject: [Buildroot] [PATCH 1/1] libcodec2: Update to version 0.6.
Message-ID: <CALdGskKdBi9_OLBAo0TSb+a1AJ5DpuLBymQckE1+DArdjTk0HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd

The easiest solution I have to fix the lib issue would be to add the
following line to the libcodec2.mk file.  I'm not sure if it would be the
preferred way to go(right solution), or if there is something that has to
be fixed in the upstream repo rather.

LIBCODEC2_CONF_OPTS += -DCMAKE_INSTALL_LIBDIR=/lib

If this is the best way, I can update the patch to that effect.

regards

Olivier
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170705/e74bacb2/attachment.html>
