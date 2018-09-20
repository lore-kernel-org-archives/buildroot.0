From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:51 -0500
Subject: [Buildroot] [PATCH 06/14] package/android-tools: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/android-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 96e36e6..478f139 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_ANDROID_TOOLS
 	  can be used to interact with target devices using of these
 	  protocols.
 
+	  https://wiki.debian.org/AndroidTools#Original_android-tools_package
+
 if BR2_PACKAGE_ANDROID_TOOLS
 
 # We need kernel headers that support the __SANE_USERSPACE_TYPES__
-- 
1.9.1
