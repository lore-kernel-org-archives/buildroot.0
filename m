From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 11 Nov 2012 10:07:46 +0000
Subject: [Buildroot] [PATCH 0/2 v3] Add neard and neardal packages
Message-ID: <1352628468-14490-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

This patch set adds the neard and neardal packages for linux-nfc support.

Simon Dawson (2):
  neard: new package
  neardal: new package

 package/Config.in          |    2 ++
 package/neard/Config.in    |   12 ++++++++++++
 package/neard/neard.mk     |   14 ++++++++++++++
 package/neardal/Config.in  |    7 +++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/neard/Config.in
 create mode 100644 package/neard/neard.mk
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

-- 
1.7.10.4
