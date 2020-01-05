From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 22:01:58 +0100
Subject: [Buildroot] [git commit] package/nano: bump version to 4.7
Message-ID: <20200105205312.400378ECBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=004be1eb9c802ea3543d9dd1ae73ca1dab6a18a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
4.6: https://lists.gnu.org/archive/html/info-gnu/2019-11/msg00011.html
4.7: https://lists.gnu.org/archive/html/info-gnu/2019-12/msg00005.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 4e967b79c3..965a94aa0b 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.5.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.7.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 ded5c38f5ecd9de2b624e0db8013a375c169d3fbbd49575967b868847df8f533  nano-4.5.tar.xz
+sha256 58c0e197de5339ca3cad3ef42b65626d612ddb0b270e730f02e6ab3785c736f5  nano-4.7.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 7817cd4187..5cb8d1d5c0 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).5
+NANO_VERSION = $(NANO_VERSION_MAJOR).7
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
