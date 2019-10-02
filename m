From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu,  3 Oct 2019 00:19:37 +0200
Subject: [Buildroot] [PATCH 3/4] package/rs485conf: add hash for license file
In-Reply-To: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
References: <20191002221938.3388096-1-m.niestroj@grinn-global.com>
Message-ID: <20191002221938.3388096-4-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/rs485conf/rs485conf.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rs485conf/rs485conf.hash b/package/rs485conf/rs485conf.hash
index e2ccbfd433..315f90a375 100644
--- a/package/rs485conf/rs485conf.hash
+++ b/package/rs485conf/rs485conf.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 f163f81cd50aae6fa39cbb4f6408a3699da7a87a56649c4b96d6f168c9be6a7d rs485conf-5c8d00cf70950fab3454549b81dea843d844492a.tar.gz
+sha256 3e5c80d50879a9572ac9e463215a942490a67b56dfd8a3e27004d7c62e0493c8 LICENSE
-- 
2.23.0
