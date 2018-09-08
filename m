From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:07:45 +0200
Subject: [Buildroot] [git commit] luarocks: add hash for license file
Message-ID: <20180908130715.06E9582DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e3a92a263da2a530a87f6c54d25aa6510a2fb66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index dcfff3c0c8..9917b1b5df 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3836267eff2f85fb552234e966602b1e649c58f81f47c7de3785e071c8127f5a  luarocks-3.0.2.tar.gz
+sha256 542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
