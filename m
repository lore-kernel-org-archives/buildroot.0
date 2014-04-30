From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 29 Apr 2014 22:52:37 -0400
Subject: [Buildroot] [PATCH v2 0/2] ccache improvements
Message-ID: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've refreshed two of the three ccache patches, the ones being considered as
part of patchwork clean-up #8, in hopes of being useful to the reviewers.

See the original cover-letter from October 2013 for more background on the
patches, if needed:

http://lists.busybox.net/pipermail/buildroot/2013-October/081488.html


Danomi Manchego (2):
  ccache: change default cache directory path to match config setting
  ccache: provide capability to do initial ccache setup

 Config.in                |   15 ++++++++++++++-
 package/ccache/ccache.mk |   21 +++++++++++++++++----
 2 files changed, 31 insertions(+), 5 deletions(-)

-- 
1.7.9.5
