From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Tue, 29 Mar 2016 12:37:56 +0200
Subject: [Buildroot] [initscripts] Default script /etc/init.d/S40network
Message-ID: <CALtfCQbJOpzar6wAmdaXzp2U7ZGLSxiZKB6yd4s_xyxxWO5fxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building a buildroot platform with raspberry pi Compute Module. I'm
using Init system BusyBox and the package initscrpts is selected
automatically.

The problem is this package has the S40network script, but the RPi compute
module doesn't have ethernet, so I think this script has to be deleted for
RPi compute module, doesn't it?

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160329/40d32a51/attachment.html>
