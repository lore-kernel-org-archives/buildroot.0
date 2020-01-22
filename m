From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:36 +0100
Subject: [Buildroot] [PATCH 04/26] package/python-iniparser: add hash for
 license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/python-iniparse/python-iniparse.hash | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index f1f803823e..b843025521 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,3 +1,7 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6, sha256 locally computed
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6
 md5 5e573e9e9733d97623881ce9bbe5eca6 iniparse-0.4.tar.gz
-sha256 abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054  iniparse-0.4.tar.gz
+
+# sha256 locally computed
+sha256  abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054  iniparse-0.4.tar.gz
+sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
+sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
-- 
2.20.1
