From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:32:55 +0100
Subject: [Buildroot] [git commit] erlang-p1-iconv: Bump to version 1.0.6
Message-ID: <20180117213347.13C6D83F1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30bb874757f858c617085771a46ab6217ea18b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
index 883fd52..0f0a231 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ca20d58166a4fb38883977600aca61e02bfd1257b8bded8c8ddd82d2a96084e6 erlang-p1-iconv-1.0.4.tar.gz
+sha256 c7214ea7503c3de1edf3bdd72b37187aa3a9a36d7cf7f5945a067ae8d262d3fb erlang-p1-iconv-1.0.6.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 044361e..6b22431 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = 1.0.4
+ERLANG_P1_ICONV_VERSION = 1.0.6
 ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = Apache-2.0
 ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
