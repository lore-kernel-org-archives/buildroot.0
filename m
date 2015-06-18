From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:46:10 +0200
Subject: [Buildroot] [PATCH 10/10] wireshark: bump to version 1.12.6
In-Reply-To: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645970-31995-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1434645970-31995-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 1.12.6
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 35eb1a2..b8368b3 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,3 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.5.txt
-md5	9ee199dde4f36a3d71f7b81dd6764e93	wireshark-1.12.5.tar.bz2
-sha1	379686f0b6355ae2e6b3f7055578317a07ce5590	wireshark-1.12.5.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.6.txt
+md5  25ad2bc1c2a21396827c238fcff51bf3  wireshark-1.12.6.tar.bz2
+sha1  5b592bd0389b76d3bdee6a7336e9492f8162c94d  wireshark-1.12.6.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index eb56808..af3d67c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.5
+WIRESHARK_VERSION = 1.12.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.3.6
