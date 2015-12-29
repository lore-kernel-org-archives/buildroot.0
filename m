From: Mathew Benson <mathew.benson@gmail.com>
Date: Mon, 28 Dec 2015 21:10:41 -0600
Subject: [Buildroot] sysroot
Message-ID: <CA+C+_XRofByfgd5oo5R1CZykm=vhsXQLD0ESODbkwxXwiTF9QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What is the best way to add 32 bit headers (i.e. gnu/stubs-32.h) to the
sysroot directory on a 64 bit build?  I need to create a sysroot for some
new code development and I'd rather use the correct files that buildroot
would have pulled in if it was a 32 bit build, rather than piece together a
sysroot manually.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151228/93a014d7/attachment.html>
