From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 21:22:56 +0100
Subject: [Buildroot] [git commit] package/daemon: add hash for license file
Message-ID: <20200122201240.3D9398370B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0068d6627f8df5febe93c0e1125ed6930e9977d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Acked-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/daemon/daemon.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index 32308ea3f7..ad8637ee81 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,3 +1,4 @@
 # md5 from http://www.libslack.org/daemon/; sha256 locally calculated
 md5 6cd0a28630a29ac279bc501f39baec66 daemon-0.6.4.tar.gz
 sha256 c4b9ea4aa74d55ea618c34f1e02c080ddf368549037cb239ee60c83191035ca1 daemon-0.6.4.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 LICENSE
