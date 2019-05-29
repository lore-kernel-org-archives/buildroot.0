From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:34 -0400
Subject: [Buildroot] [PATCH 16/19] package/swig: add hashes for license files
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-17-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/swig/swig.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 77c93a96d6..8a3e476c61 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256	7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d	swig-3.0.12.tar.gz
+sha256	f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e	LICENSE
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE-GPL
+sha256	7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2	LICENSE-UNIVERSITIES
-- 
2.21.0
