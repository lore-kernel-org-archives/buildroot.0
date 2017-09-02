From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:34 +0200
Subject: [Buildroot] [PATCH 04/12] dado: bump to version 1.8.3
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dado/dado.hash | 2 +-
 package/dado/dado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index 984ef3f85..973bdb3ff 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dea331051c92ef2fbb22025a4f02e84e63d63148a66589401404877727f59941  dado-1.8.0-1.src.rock
+sha256 5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index 7ae4edfbc..acef04777 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DADO_VERSION = 1.8.0-1
+DADO_VERSION = 1.8.3-1
 DADO_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.11.0
