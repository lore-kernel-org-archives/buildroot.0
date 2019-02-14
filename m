From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Feb 2019 22:43:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/madplay: add hash for license files
In-Reply-To: <20190214214321.31854-1-fontaine.fabrice@gmail.com>
References: <20190214214321.31854-1-fontaine.fabrice@gmail.com>
Message-ID: <20190214214321.31854-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
