From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:14:59 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/madplay: add hash
 for license files
Message-ID: <20190221161923.2ABFC860B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d27255a4e03ec02c4a8046d1fdae7a1df6077de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4211a7d64a7756bee15b88e8211511d5bbd4c27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/madplay.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/madplay/madplay.hash b/package/madplay/madplay.hash
index 99487b5ecd..227702976b 100644
--- a/package/madplay/madplay.hash
+++ b/package/madplay/madplay.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0  madplay-0.15.2b.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  915bfd70548f31d11f9b4ffb21f343d1196af96c79d6aaac5663ea46c39dd3a3  COPYRIGHT
