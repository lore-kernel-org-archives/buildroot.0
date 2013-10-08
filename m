From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 10:46:57 +0800
Subject: [Buildroot] [PATCH 2/2] stress: add license information
In-Reply-To: <1381200229.18302.0.camel@phoenix>
References: <1381200229.18302.0.camel@phoenix>
Message-ID: <1381200417.18302.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/stress/stress.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 6e82b50..387166d 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -6,6 +6,8 @@
 
 STRESS_VERSION = 1.0.4
 STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
+STRESS_LICENSE = GPLv3+
+STRESS_LICENSE_FILES = COPYING
 STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
-- 
1.8.1.2
