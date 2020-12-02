From: C Larbi <pkl2000us@gmail.com>
Date: Wed, 2 Dec 2020 19:45:42 +0000
Subject: [Buildroot] [ISSUE] gdk-pixbuf dependency on librsvg for its SVG
 loader
Message-ID: <CANVomh9E4fVo0tP7yTc0goGD5FD9f6BqNymSvLvz3wv6sQDV1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GDK-PIXBUF provides image handling for gtk3.

To add SVG support, the librsvg package is required.

However, the configuration option " --disable-pixbuf-loader" in librsvg.mk
prevents the required image loader to be built for GDK.

I suggest to the maintainers of the package to add a conditional clause in
the makefile to add or remove this configuration option depending on
whether the libgtk3 package has been selected

Regards
Cerezo Larbi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201202/c748bdf1/attachment.html>
