From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:54:06 +0100
Subject: [Buildroot] [git commit] Config.in: Introduce a new
	BR2_DEPRECATED_SINCE_2015_11 variable
Message-ID: <20151217205545.2815682565@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=429a11647a3e0eb1e6781a0008252144729f255e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 1809eeb..0be44d9 100644
--- a/Config.in
+++ b/Config.in
@@ -337,6 +337,10 @@ config BR2_DEPRECATED_SINCE_2015_08
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_11
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
