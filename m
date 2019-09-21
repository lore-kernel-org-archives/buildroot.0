From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:42 +0200
Subject: [Buildroot] [git commit] package/python-pyasn: add missing hash for
 LICENSE.txt file
Message-ID: <20190921135526.07D388EE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=920c50b03c3f8b151bdcf1b487e3ab729d52f0af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
