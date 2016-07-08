From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 8 Jul 2016 11:10:31 +0200
Subject: [Buildroot] Config defined package version is always built
Message-ID: <CAM+bi4tV3U-JVJkB3YY1pZY7ce12hzqXLZ7x+ebM=JzUdT7=bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm writing a custom package whose version I want to define via menuconfig.
Thus, I include in Config.in a string config option called
BR2_PACKAGE_MYPKG_VERSION, and inside mypkg.mk I set MYPKG_VERSION =
$(BR2_PACKAGE_MYPKG_VERSION)

This works fine, I can set any version I want via menuconfig and buildroot
will download and install that version from a git repository.

However, whenever I type make, this package will be built again, even if it
has just been built and no change have been made.

Is there anyway to avoid this?

Thanks!

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160708/ce4b1a28/attachment.html>
