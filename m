From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  8 Mar 2021 14:27:41 +0100
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: adopt package/sysklogd
In-Reply-To: <20210308132742.4022471-1-troglobit@gmail.com>
References: <20210308132742.4022471-1-troglobit@gmail.com>
Message-ID: <20210308132742.4022471-3-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since I'm the upstream maintainer and we use it for $DAYJOB, I'll adopt.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7f8587d1b..f6d6e4aa06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1286,6 +1286,7 @@ F:	board/globalscale/espressobin/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
+F:	package/sysklogd/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
-- 
2.25.1
