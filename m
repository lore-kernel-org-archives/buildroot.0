From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:10 +0100
Subject: [Buildroot] [PATCH 3/7 v3] conf: add a sample run-time
	configuration file
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <591c08819a0c2a46abbf4ab8219c3ad582487da3.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 conf/buildroot-autobuild.sample | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 conf/buildroot-autobuild.sample

diff --git a/conf/buildroot-autobuild.sample b/conf/buildroot-autobuild.sample
new file mode 100644
index 0000000..dcb74b1
--- /dev/null
+++ b/conf/buildroot-autobuild.sample
@@ -0,0 +1,5 @@
+[main]
+ninstances = 4
+njobs = 4
+nice = 20
+submitter = John Doe
-- 
1.9.1
