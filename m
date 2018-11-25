From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 24 Nov 2018 23:59:36 -0200
Subject: [Buildroot] [PATCH] stress-ng: really remove patch merged upstream
Message-ID: <20181125015936.25145-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should have been removed in commit 27bce5fc8e (package/stress-ng: bump
to version 0.09.39) but was left as an empty file.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
This should be applied on master to remove the empty patch before
releasing Buildroot 2018.11.
---
 .../0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch

diff --git a/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.19.1
