From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x]
 package/dovecot-pigeonhole: security bump version to 0.5.7.2
Message-ID: <20190902161339.5AA888148C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a79f7ef4c54a2de5b3a589bbf7e278a3233977f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes:
https://dovecot.org/pipermail/dovecot/2019-August/116876.html

Fixes
* CVE-2019-11500: ManageSieve protocol parser does not properly handle
  NUL byte when scanning data in quoted strings, leading to out of
  bounds heap memory writes. Found by Nick Roessler and Rafi Rubin.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 77b2dd9a538e8686d65e843b26cb4c06e61fddb1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 6435aa9ccf..eac675505c 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 3270b24c1f75a7c144f54d6d08ce994176e39c2cdb3ac4dd80ad5e64aaaa2028  dovecot-2.3-pigeonhole-0.5.7.1.tar.gz
+sha256 d59d0c5c5225a126e5b98bf95d75e8dd368bdeeb3da2e9766dbe4fddaa9411b0  dovecot-2.3-pigeonhole-0.5.7.2.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index ecde286ffa..43519499c4 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.7.1
+DOVECOT_PIGEONHOLE_VERSION = 0.5.7.2
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
