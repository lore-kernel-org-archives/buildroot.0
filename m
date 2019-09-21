From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:42 +0200
Subject: [Buildroot] [git commit] package/python-pyzmq: add missing hashes
 for COPYING.(BSD|LESSER) files
Message-ID: <20190921135526.14F808EE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83268eb4d046f5f662d307901637c360d0e6a3fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
