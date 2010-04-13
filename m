From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:05:33 +0200
Subject: [Buildroot] [pull request] Pull request for various bumps
Message-ID: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Amongst other things, this serie bumps a few package to up to date
releases, it also removes some useless PACKAGE_TARGET_INSTALL options
and adds lirc support (quite usefull for STBs).

Concerning cairo/glib/libsoup/webkit/directfb bumps, I tested them on
a sh4 target, no problem so far (correct rendering in a webkit view).
Unfortunatly I can't bump gtk+ to 2.20. The directfb-gdk backend seems
to be broken since GTK+ 2.16. Most of bugs have been reported, some
aren't fixed yet.

Changes availables at :
           git://git.potipota.net/buildroot various-bumps

Regards,

--
Lionel Landwerlin
