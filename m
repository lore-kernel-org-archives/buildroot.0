From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 22:43:05 +0200
Subject: [Buildroot] [git commit] wireshark: bump to version 1.12.6
Message-ID: <20150618204351.A5C0481E03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2536d9ebd123828f5b4f572e9999f37eb2cb007e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 1.12.6
- Update hash file

The following vulnerabilities have been fixed in 1.12.6:

 - wnpa-sec-2015-19
   WCCP dissector crash. (Bug 11153)
 - wnpa-sec-2015-20
   GSM DTAP dissector crash. (Bug 11201)

[Thomas: indicate that this is a security related updated in the
commit log, as suggested by Gustavo.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash |    6 +++---
 package/wireshark/wireshark.mk   |    2 +-
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
