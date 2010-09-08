From: mailing list <mailinglist@gatt.me>
Date: Wed, 8 Sep 2010 09:58:50 +0100
Subject: [Buildroot] Qt QtUiTools
Message-ID: <AANLkTinS00d+cpiORtAghjVRibz+_3K5Zh1mWBzPBLbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've recently used the Qt build of buildroot and noticed that I couldn't use
QUiLoader, I had to add "-make tools" to the configure line to compile the
necessary libraries so that I could use these functions. I don't believe it
affects the rootfs size (although I have to admit I didn't run a test), but
the extra functionality gets compiled into the executable if i understand it
correctly. It will however increase build time. No other libraries require
copying across.

I was wondering if it would be worth adding this as an option to menuconfig
so that it can be built if required.

Andrew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100908/a6c42fb9/attachment.html>
