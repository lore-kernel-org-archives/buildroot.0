From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2021 08:32:35 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/dovecot-pigeonhole: bump version to 0.5.13
Message-ID: <20210108071452.EEC8C86ADA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=912bf39711a177ae7f8ffb720e963299321a2e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-January/000449.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8d1c4c717e8902b37979a155f2c073b7f8bbb519)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 7f4b8579c1..f2c76a05fd 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  0b972a441f680545ddfacd2f41fb2a705fb03249d46ed5ce7e01fe68b6cfb5f0  dovecot-2.3-pigeonhole-0.5.11.tar.gz
+sha256  911fe566da5b638eab1b11105314300bc9049cc3832d4bd2aed44c265013bf17  dovecot-2.3-pigeonhole-0.5.13.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 462c992902..5c4cdb633e 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.11
+DOVECOT_PIGEONHOLE_VERSION = 0.5.13
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
