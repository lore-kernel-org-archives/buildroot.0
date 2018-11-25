From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:21:54 +0100
Subject: [Buildroot] [git commit] package/stress-ng: really remove patch
 merged upstream
Message-ID: <20181202071559.174797F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d8e9643c676ba246bed0529222cc6fb2dc74ee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Should have been removed in commit 27bce5fc8e (package/stress-ng: bump
to version 0.09.39) but was left as an empty file.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
deleted file mode 100644
index e69de29bb2..0000000000
