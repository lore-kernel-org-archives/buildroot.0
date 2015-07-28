From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:14 +0200
Subject: [Buildroot] [git commit branch/next] docker: add hash file
Message-ID: <20150808105648.E96EB7FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=927748ecbbfb01fcbdfd818899a213b72b412927
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker/docker.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/docker/docker.hash b/package/docker/docker.hash
new file mode 100644
index 0000000..710a0eb
--- /dev/null
+++ b/package/docker/docker.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	47629578e89d96d1541c91d040aec4316f03ad6d01dc3eecb8f82a33445c1e4e	docker-1.5.tar.gz
