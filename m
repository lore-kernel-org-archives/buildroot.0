From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 19:56:14 +0200
Subject: [Buildroot] Change in Qt5 download URLs
Message-ID: <20130818195614.2b509547@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The download URLs for the Qt5 submodules tarballs have recently
changed, which is quite annoying for embedded Linux build systems.

But what's even more annoying is that the new organization of files
adopted in http://download.qt-project.org/ seems to imply that the most
recent version of Qt is available in
http://download.qt-project.org/official_releases/qt/, and then, once a
newer Qt release is shipped, the older one gets moved to
http://download.qt-project.org/archive/qt/.

This is really annoying for embedded Linux build systems: they have
recipes to help people cross-compile many libraries/applications to
create an embedded Linux system, and therefore they contain the URL of
upstream tarballs of source code. Moving tarballs around after a
release has been made breaks the recipes of all those build systems.

Would it be possible for the Qt project to adopt a file organization
that does not move tarballs once a release has been made?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
