From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:21 -0400
Subject: [Buildroot] [PATCH 09/22] package/wayland: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/wayland/wayland.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index f66a20efe5..7408e91229 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -3,3 +3,6 @@ md5  d91f970aea11fd549eae023d06f91af3  wayland-1.17.0.tar.xz
 sha1 4d9e08a7a4a07fa37a25d7aa3ef83f08edec0600  wayland-1.17.0.tar.xz
 sha256 72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4  wayland-1.17.0.tar.xz
 sha512 c5051aab5ff078b368c196ecfedb33ccd961265bb914845d7ed81de361bb86ae18299575baa6c4eceb0d82cf8b495e8293f31b51d1cbc05d84af0a199ab3f946  wayland-1.17.0.tar.xz
+
+# Locally calculated
+sha256 6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
-- 
2.21.0
