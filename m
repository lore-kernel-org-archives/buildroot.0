From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Feb 2015 22:05:38 +0100
Subject: [Buildroot] [PATCH v3 0/3] Adding GTK# package
Message-ID: <1423688741-22856-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds GTK# gui librrary for mono and enables inclusion
of future third party mono software libreries.

---
Changes v1 -> v3:
  - General patch cleaning

Angelo Compagnucci (3):
  package/mono: enable mono library compilation
  system: Defaulting TZ_LOCALTIME to UTC
  package/gtksharp: new package

 package/Config.in            |  5 +++++
 package/gtksharp/Config.in   |  9 +++++++++
 package/gtksharp/gtksharp.mk | 13 +++++++++++++
 package/mono/mono.mk         |  1 -
 system/Config.in             |  1 +
 5 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 package/gtksharp/Config.in
 create mode 100644 package/gtksharp/gtksharp.mk

-- 
1.9.1
