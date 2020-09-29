From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 29 Sep 2020 16:27:25 +0200
Subject: [Buildroot] Issue: defconfigs using a custom toolchain now using
 bootlin instead
Message-ID: <CADYdroMF0NOBdJLYQfsi0345AKNcexYc-vsQaXOpEPDq_ioJkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I spent some time wondering why my buildroot build now wraps an unkown
compiler,
instead an specific toolchain.
It appears that the external Toolchain type now defaults to bootlin instead
of custom,
removing other settings aswell (path + prefix at least).

Now checking if thats the only thing thats broken now =/

Norbert
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200929/7e8ccf14/attachment.html>
