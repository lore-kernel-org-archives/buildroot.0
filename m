From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Mon, 27 Jan 2020 16:01:17 +0100
Subject: [Buildroot] Requirements for QML in RPi4
Message-ID: <CAPmASevs=kKKCspFM0M_ydbeSzNJLGEEiGmrgb6Ap-RqUtE-Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After several years I'm going to give another try to Buildroot :-)
This time I built an environment for RPi4+Qt5.
Surely I missed some packages because if I try to run a QML application I
got the following error:

> Could not find DRM device!
> Aborted

Instead a Qt5 console application seems to run fine.

I attach my .config file. Hope you can give me some hints!
Best regards
Andrea
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200127/b6a67040/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 109442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200127/b6a67040/attachment.obj>
