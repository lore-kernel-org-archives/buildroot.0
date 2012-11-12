From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 12 Nov 2012 10:09:59 +0000
Subject: [Buildroot] [PATCH v4 0/2] Add neard and neardal packages
Message-ID: <1352715001-6673-1-git-send-email-spdawson@gmail.com>
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
 package/neardal/Config.in  |   12 ++++++++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/neard/Config.in
 create mode 100644 package/neard/neard.mk
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

-- 
1.7.10.4
