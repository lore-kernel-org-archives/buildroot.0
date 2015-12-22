From: Mathew Benson <mathew.benson@gmail.com>
Date: Tue, 22 Dec 2015 10:07:35 -0600
Subject: [Buildroot] Newbie boot and fs mount question
Message-ID: <CA+C+_XSCm9Q1uE7Zg2VcK6xCa3ASEUNFTX=0GF3=KwaUYQWTzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How do I mount / from sda1 rather than RAM disk?

Sorry for the simple question and let me know if there is a better forum
for this.  I'm new to buildroot and busybox and haven't compiled a custom
kernel in at least 15 years.  I'm using the latest version of buildroot as
of this weekend, used the predefined i386 config, and built with kernel
version 3.8.17.  It seems to boot just fine but it appears the file system
is mounted from the initial RAM disk.  Any change I make to the file system
is volatile.  What do I need to do to make it mount / from sda1 instead of
the RAM disk?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151222/2cc00e13/attachment.html>
