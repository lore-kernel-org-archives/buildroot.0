From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Sep 2017 22:41:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/efl: bump to 1.20.3
In-Reply-To: <20170907204113.14249-1-romain.naour@gmail.com>
References: <20170907204113.14249-1-romain.naour@gmail.com>
Message-ID: <20170907204113.14249-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.enlightenment.org/news/efl-1.20.3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 9d553ad..ceeb788 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.2.tar.xz.sha256
-sha256	a540cb96f0a2a8f2e3001108d8432d2f21b45f6b12bd511eeebaadd5c934947e	efl-1.20.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.3.tar.xz.sha256
+sha256	1273014aff3cd313a315f6745b02958668083726d830873b681fe726b9421191	efl-1.20.3.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index b4cdeed..f1bcd53 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.2
+EFL_VERSION = 1.20.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
-- 
2.9.5
