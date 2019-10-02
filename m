From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu,  3 Oct 2019 00:19:36 +0200
Subject: [Buildroot] [PATCH 2/4] package/lzop: add hash for license file
In-Reply-To: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
References: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
Message-ID: <20191002221938.3388096-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/lzop/lzop.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index a484e7f262..8496ac2188 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9 lzop-1.03.tar.gz
+sha256 70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c COPYING
-- 
2.23.0
