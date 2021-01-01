From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jan 2021 23:47:11 +0100
Subject: [Buildroot] [git commit] package/python-mwscrape2slob: bump version
Message-ID: <20210101223449.44C0484C6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68775e6fd5ce896436501f25a0cd99a96dc114ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mwscrape2slob/python-mwscrape2slob.hash | 2 +-
 package/python-mwscrape2slob/python-mwscrape2slob.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.hash b/package/python-mwscrape2slob/python-mwscrape2slob.hash
index f1f5e4f166..51b625856c 100644
--- a/package/python-mwscrape2slob/python-mwscrape2slob.hash
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 367ffc3203f7eb2cc26211f58c0693526652d9a238af48c88f936920e804faf7  python-mwscrape2slob-0f9124ed62009dff6a230947d80340f5a61a6f49.tar.gz
+sha256  f1c1c79526fb3e0dac1c2c43e57a38b8641672e7008c5530d4b75e864eff232a  python-mwscrape2slob-e01d3e92f0a372ebd0f57390e437a28f9d3c0438.tar.gz
diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.mk b/package/python-mwscrape2slob/python-mwscrape2slob.mk
index 519f5e5ed2..cd8ae35234 100644
--- a/package/python-mwscrape2slob/python-mwscrape2slob.mk
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MWSCRAPE2SLOB_VERSION = 0f9124ed62009dff6a230947d80340f5a61a6f49
+PYTHON_MWSCRAPE2SLOB_VERSION = e01d3e92f0a372ebd0f57390e437a28f9d3c0438
 PYTHON_MWSCRAPE2SLOB_SITE = $(call github,itkach,mwscrape2slob,$(PYTHON_MWSCRAPE2SLOB_VERSION))
 PYTHON_MWSCRAPE2SLOB_LICENSE = GPL-3.0, Apache-2.0 (MathJax), GPL (MediaWiki monobook style sheet)
 PYTHON_MWSCRAPE2SLOB_SETUP_TYPE = distutils
