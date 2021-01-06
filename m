From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 08:00:33 +0100
Subject: [Buildroot] [git commit] package/dovecot: security bump version to
 2.3.13
Message-ID: <20210106064925.54045866BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df4447724f2dbd4ee54dddec1d12ecd3b130602b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit:
https://github.com/dovecot/core/commit/bf7952d33e39358a1258697505ed25c050e14bbb

Fixes the following CVEs:

CVE-2020-24386:
https://dovecot.org/pipermail/dovecot-news/2021-January/000450.html

CVE-2020-25275:
https://dovecot.org/pipermail/dovecot-news/2021-January/000451.html

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-January/000448.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 4 ++--
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e5c2ab6f40..4d69f3abdd 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  d3d9ea9010277f57eb5b9f4166a5d2ba539b172bd6d5a2b2529a6db524baafdc  dovecot-2.3.11.3.tar.gz
-sha256  a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
+sha256  a3f875b80ec11a452480690108660030978c94fa8e796ad6d943a874b496f1c4  dovecot-2.3.13.tar.gz
+sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index f0508753a2..3100bfbc93 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).11.3
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).13
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
