From: Ilias Apalodimas <apalos@gmail.com>
Date: Tue,  7 Feb 2017 18:20:57 +0200
Subject: [Buildroot] [PATCH 0/1] Added keepalived package
Message-ID: <1486484458-8233-1-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Support for keepalived

Ilias Apalodimas (1):
  Added keepalived package

 package/Config.in                |  1 +
 package/keepalived/Config.in     | 13 +++++++++++++
 package/keepalived/keepalived.mk | 13 +++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/keepalived/Config.in
 create mode 100644 package/keepalived/keepalived.mk

-- 
1.9.1
