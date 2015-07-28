From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:58 -0300
Subject: [Buildroot] [PATCH 057/113] mesa3d-demos: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-57-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mesa3d-demos/mesa3d-demos.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mesa3d-demos/mesa3d-demos.hash

diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
new file mode 100644
index 0000000..17db1b0
--- /dev/null
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92	mesa-demos-8.2.0.tar.bz2
-- 
2.3.6
