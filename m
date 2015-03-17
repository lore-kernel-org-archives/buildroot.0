From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 16:32:51 +0100
Subject: [Buildroot] [PATCH 0/2] Sysdig: new package.
Message-ID: <1426606373-11438-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces new package Sysdig.

Angelo Compagnucci (2):
  package/luajit: introducing luajit arch supports.
  package/sysdig: New package

 package/Config.in        |  1 +
 package/luajit/Config.in | 12 ++++++++++--
 package/sysdig/Config.in | 21 +++++++++++++++++++++
 package/sysdig/sysdig.mk | 22 ++++++++++++++++++++++
 4 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/sysdig/Config.in
 create mode 100644 package/sysdig/sysdig.mk

-- 
1.9.1
