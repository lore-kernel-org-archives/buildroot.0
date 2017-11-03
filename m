From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:40 +0100
Subject: [Buildroot] [PATCH 05/31] package/bluez_utils: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-6-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/bluez_utils/bluez_utils.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bluez_utils/bluez_utils.hash b/package/bluez_utils/bluez_utils.hash
index 09b7b21d82..8243338255 100644
--- a/package/bluez_utils/bluez_utils.hash
+++ b/package/bluez_utils/bluez_utils.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
 sha256	41f9578bef39b8c94a2d6ddeaa556afd22d136936d0f03100e422fe970a45a7d  bluez-4.101.tar.xz
+sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
-- 
2.15.0
