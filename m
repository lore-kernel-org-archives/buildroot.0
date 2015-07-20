From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:50 +0200
Subject: [Buildroot] [PATCH 02/11] package/stress: remove autoreconf
In-Reply-To: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
References: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437414479-16714-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf is not needed anymore since non-lfs enabler patch
has been removed.

commit: 415765b5a8861f3b7e86e9786bf903a5a4d09e73

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/stress/stress.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 4bb801e..1b5ba06 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -8,7 +8,6 @@ STRESS_VERSION = 1.0.4
 STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
 STRESS_LICENSE = GPLv2+
 STRESS_LICENSE_FILES = COPYING
-STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
 # However, this option is always specified in the global
-- 
2.4.3
