From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 21:05:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/c-icap: bump to version 0.5.7
Message-ID: <20210208200519.325110-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://sourceforge.net/p/c-icap/news/2020/10/the-c-icap-057-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-icap/c-icap.hash | 6 +++---
 package/c-icap/c-icap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 8c70d75589..6aa81c2641 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,6 +1,6 @@
 # Retrieved from https://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/
-md5  d59e767ee3733cd81cea02819f13ac72  c_icap-0.5.6.tar.gz
-sha1  361e36b63f895bd72bdd18aac5fe4192d4eff530  c_icap-0.5.6.tar.gz
+md5  82fd2fba1a08a8a0cf3567fe24aa035d  c_icap-0.5.7.tar.gz
+sha1  3b2470e00abd1418bec3a440d3073d7a6231c4c1  c_icap-0.5.7.tar.gz
 # Locally calculated
-sha256  9826c50fc34f8fd4a3115844b27c9816dd3fcc3e7e2a3b6bcc7094ec307802b7  c_icap-0.5.6.tar.gz
+sha256  01ef17d7999d3476fe705abc56d0da562c2f180aafe08fc1269f419cad8521a9  c_icap-0.5.7.tar.gz
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 1a68674a67..79e317fb29 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.5.6
+C_ICAP_VERSION = 0.5.7
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
-- 
2.29.2
