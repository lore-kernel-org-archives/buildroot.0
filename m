From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:24:12 +0200
Subject: [Buildroot] [git commit] qt: rename qtopia4 to qt
Message-ID: <20090727132435.4CB44777EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20d2c70fbda47a6a2eb571da33a9526a0b8c7a1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A while ago, Trolltech (now part of Nokia) included Qtopia directly
inside Qt. So let's rename the qtopia4 package to simply qt, which
will be more familiar to our users. Of course, the version we compile
is Qt for Embedded Linux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
