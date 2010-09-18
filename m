From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:38:07 +0200
Subject: [Buildroot] [pull request] small bumps
Message-ID: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie bumps automake to 1.11.1 and gettext to 0.18.1.1. Automake
1.11.1 brings a nice "silent" mode when compiling packages, and we had
an old gettext version. Some packages like gstreamer expect gettext
0.17 to be autoreconfigured. Also the gettext package has been
converted to new package infrastructure.

The patch concerning autotools rules brings the ability to have a
better control over the autoreconfiguration process.

Regards,

--
Lionel Landwerlin
