From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Jul 2015 09:12:15 -0300
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.75
Message-ID: <1438344736-11339-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/dnsmasq.hash | 2 +-
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 370792f..57dc4b1 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9ed484b9879d63f7a0bc1010562f17d8aaadf4261e9a126299796cb9696d93ba	dnsmasq-2.74.tar.xz
+sha256	640c4e1d4c298e42458419cd78cfc26acc549401b1a34d271cd3e0e4226941f1	dnsmasq-2.75.tar.xz
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 0df33ca..a0db81b 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.74
+DNSMASQ_VERSION = 2.75
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.4.6
