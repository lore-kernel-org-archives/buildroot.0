From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:16:38 +0200
Subject: [Buildroot] [git commit] lttng-babeltrace: add explicit
	dependencies for host variant
Message-ID: <20160703071656.2640C80066@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb12ad357832c9aedc3f3aa41ee0ddebcd8e64fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index fdc647e..b2e03a9 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -11,6 +11,9 @@ LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (tes
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
+	host-popt host-util-linux host-libglib2 host-pkgconf
+
 # for 0002-configure-fix-uuid-support-detection-on-static-build.patch
 LTTNG_BABELTRACE_AUTORECONF = YES
 
