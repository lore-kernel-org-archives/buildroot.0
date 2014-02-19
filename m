From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Feb 2014 10:53:19 +0100
Subject: [Buildroot] [PATCH 0/3] mplayer autobuild fixes
Message-ID: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some mplayer autobuild fixes.

Best regards

Fabio Porcedda (3):
  mplayer: not available on bfin
  mplayer: remove sh2 support
  mplayer: add missing reverse dependencies for bfin and sh2a

 package/libplayer/Config.in | 3 ++-
 package/mplayer/Config.in   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.8.5.2
