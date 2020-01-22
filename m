From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:33 +0100
Subject: [Buildroot] [PATCH 01/26] package/crudini: add hash for license file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/crudini/crudini.hash | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 9279847be9..6c08223b83 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,3 +1,6 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9b8500c90467f0a61c714fbe852c2a66, sha256 locally computed
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9b8500c90467f0a61c714fbe852c2a66
 md5    9b8500c90467f0a61c714fbe852c2a66 crudini-0.9.tar.gz
-sha256 10512a5a2f7b54b42e48a1d00f0c6398947c2ba6c264b9fdef86677f0e949fd3  crudini-0.9.tar.gz
+
+# locally computed
+sha256  10512a5a2f7b54b42e48a1d00f0c6398947c2ba6c264b9fdef86677f0e949fd3  crudini-0.9.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-- 
2.20.1
