From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu,  3 Oct 2019 00:19:35 +0200
Subject: [Buildroot] [PATCH 1/4] package/easydbus: add hash for license file
In-Reply-To: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
References: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
Message-ID: <20191002221938.3388096-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/easydbus/easydbus.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
index 5e0484e9a6..49245709f6 100644
--- a/package/easydbus/easydbus.hash
+++ b/package/easydbus/easydbus.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 4626d6af3d9000d7e6ee9723abba7cd5f01d1c52420a80d8259dfa2d884faa11 easydbus-b86721147b265dfefc9a857669408cb6eb3d6560.tar.gz
+sha256 dec3b3103cd6889045da86fc7da22bd25545966e5bd7c214791b922dec19588b LICENSE
-- 
2.23.0
