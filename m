From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:35 +0100
Subject: [Buildroot] [PATCH 03/26] package/phytool: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/phytool/phytool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/phytool/phytool.hash b/package/phytool/phytool.hash
index ce04936417..b6bfd8132f 100644
--- a/package/phytool/phytool.hash
+++ b/package/phytool/phytool.hash
@@ -2,3 +2,4 @@
 # sha256 locally computed:
 md5  972982f8e5f7237cbccfc6d275da7348  phytool-2.tar.xz
 sha256  9901a14e8c6af02b7333c60b21ff81f50620e8326d54827185e5617ff9b11d21  phytool-2.tar.xz
+sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  LICENSE
-- 
2.20.1
