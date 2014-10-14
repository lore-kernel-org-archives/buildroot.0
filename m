From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:56:00 -0300
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: add hash
In-Reply-To: <1413284160-20587-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284160-20587-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284160-20587-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/wpa_supplicant/wpa_supplicant.hash

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
new file mode 100644
index 0000000..947ae23
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a	wpa_supplicant-2.3.tar.gz
-- 
2.0.4
