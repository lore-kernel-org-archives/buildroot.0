From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Nov 2014 10:13:34 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
Message-ID: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set improves silent builds.

Silent builds are nice when top-level parallel make is being used to
reduce the output clutter.

The change logs are in each patch.

Best regards
Fabio Porcedda (3):
  Makefile: improve detection of make "-s" flag
  pkg-download: silence the svn download helper if it is a silent build
  support/download: silence git if it is a silence build

 Makefile                |  2 +-
 package/pkg-download.mk |  5 +++--
 support/download/git    | 14 ++++++++++----
 3 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.1.3
