From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:20:43 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/dovecot: security
 bump version to 2.3.15
Message-ID: <20210624065201.138448DC69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e353f32b8241c92db0fe53ce35b69476ffff8e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes several security bugs:

CVE-2021-29157
- https://dovecot.org/pipermail/dovecot-news/2021-June/000461.html

CVE-2021-33515
- https://dovecot.org/pipermail/dovecot-news/2021-June/000462.html

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-June/000457.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c711012fa5aea8c3cb9f6fb2470d7b9be849db40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index edb9d20e6d..cd314cf0dd 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  c8b3d7f3af1e558a3ff0f970309d4013a4d3ce136f8c02a53a3b05f345b9a34a  dovecot-2.3.14.tar.gz
+sha256  21bbdd5d45957a99133de8b7e71813ecb73d9476c89dfc63479e9102b3553590  dovecot-2.3.15.tar.gz
 sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a38cf1941a..93d04fc8a1 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).14
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).15
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
