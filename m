From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 18:00:46 +0200
Subject: [Buildroot] [PATCH 0/3] sysdig bump to 0.17.0
Message-ID: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps sysdig to version 0.17.0,
adds a new package libb64 as a dependency and
fixes the staging installation for jq.

Angelo Compagnucci (3):
  package/libb64: new package
  package/jq: install to staging
  package/sysdig: bump to version 0.17.0

 package/Config.in          |  1 +
 package/jq/jq.mk           |  1 +
 package/libb64/Config.in   | 12 ++++++++++++
 package/libb64/libb64.hash |  3 +++
 package/libb64/libb64.mk   | 32 ++++++++++++++++++++++++++++++++
 package/sysdig/Config.in   |  5 +++++
 package/sysdig/sysdig.hash |  2 +-
 package/sysdig/sysdig.mk   |  8 +++++---
 8 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 package/libb64/Config.in
 create mode 100644 package/libb64/libb64.hash
 create mode 100644 package/libb64/libb64.mk

-- 
2.7.4
