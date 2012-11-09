From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 11:05:03 +0000
Subject: [Buildroot] [PATCH 0/2] Add neard and neardal packages
Message-ID: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
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
 package/neard/Config.in    |   15 +++++++++++++++
 package/neard/neard.mk     |   16 ++++++++++++++++
 package/neardal/Config.in  |   11 +++++++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/neard/Config.in
 create mode 100644 package/neard/neard.mk
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

-- 
1.7.10.4
