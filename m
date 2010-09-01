From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:05:03 +0200
Subject: [Buildroot] [PATCH 11/11] Tell git to ignore the Quilt internal
	directory in package/config
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b43c20130db20c8e386673866b066bf699081ea0.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/.gitignore |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 624f650..106bc12 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -21,3 +21,8 @@ nconf
 qconf
 gconf
 kxgettext
+
+#
+# Quilt is being used to handle the patch series
+#
+.pc
-- 
1.7.0.4
