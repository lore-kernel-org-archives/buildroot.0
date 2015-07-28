From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:54 -0300
Subject: [Buildroot] [PATCH 113/113] docker: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-113-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/docker/docker.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/docker/docker.hash

diff --git a/package/docker/docker.hash b/package/docker/docker.hash
new file mode 100644
index 0000000..710a0eb
--- /dev/null
+++ b/package/docker/docker.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	47629578e89d96d1541c91d040aec4316f03ad6d01dc3eecb8f82a33445c1e4e	docker-1.5.tar.gz
-- 
2.3.6
