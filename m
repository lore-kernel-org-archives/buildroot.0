From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:38 +0000
Subject: [Buildroot] [PATCH 6/9] package/python-pyzmq: add missing hashes
 for COPYING.(BSD|LESSER) files
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-7-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/python-pyzmq/python-pyzmq.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 330ca7b4cd..262777bee0 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,3 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
 md5	1bcdc3a18c99875e01a24735dc168b8d  pyzmq-18.0.2.tar.gz
 sha256	31a11d37ac73107363b47e14c94547dbfc6a550029c3fe0530be443199026fc2  pyzmq-18.0.2.tar.gz
+
+# Locally calculated
+sha256 aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2   COPYING.BSD
+sha256 44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d   COPYING.LESSER
-- 
2.20.1
