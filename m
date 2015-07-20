From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/stress: remove autoreconf
Message-ID: <20150720205435.149167FA54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06ba02a936459cb023a3be893d5ae2cb2914ae66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoreconf is not needed anymore since non-lfs enabler patch
has been removed.

commit: 415765b5a8861f3b7e86e9786bf903a5a4d09e73

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stress/stress.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
