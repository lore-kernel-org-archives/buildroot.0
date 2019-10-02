From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu,  3 Oct 2019 00:19:38 +0200
Subject: [Buildroot] [PATCH 4/4] package/turbolua: add hash for license file
In-Reply-To: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
References: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
Message-ID: <20191002221938.3388096-5-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/turbolua/turbolua.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index 03744d83b4..b095f5aaa9 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3 turbolua-2.1.3.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
-- 
2.23.0
