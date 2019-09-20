From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:36 +0000
Subject: [Buildroot] [PATCH 5/9] package/python-pyasn: add missing hash for
 LICENSE.txt file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-6-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/python-pyasn/python-pyasn.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pyasn/python-pyasn.hash b/package/python-pyasn/python-pyasn.hash
index 59c90a832b..c08b64dd25 100644
--- a/package/python-pyasn/python-pyasn.hash
+++ b/package/python-pyasn/python-pyasn.hash
@@ -1,3 +1,6 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f00a02a631d4016818659d1cc38d229a, sha256 locally computed
 md5     f00a02a631d4016818659d1cc38d229a  pyasn1-0.1.9.tar.gz
 sha256  853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f  pyasn1-0.1.9.tar.gz
+
+# Locally calculated
+sha256  8bea85439e7446ecb270079cce926d605a7d10f51fe8789b1aeced557dcbe1b6  LICENSE.txt
-- 
2.20.1
