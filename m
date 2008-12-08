From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 00:08:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081208080814.0DA0C3C2B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 00:08:13 -0800 (Mon, 08 Dec 2008)
New Revision: 24306

Log:
Remove dead directories after moving audio and video to multimedia

This patch removes some empty directories which got left behind when audio and
video packages got moved into packages/multimedia directory.



Removed:
   trunk/buildroot/package/audio/
   trunk/buildroot/package/mplayer/
   trunk/buildroot/package/vlc/


Changeset:
