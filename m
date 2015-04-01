From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:42:32 +0200
Subject: [Buildroot] [git commit] toolchain-common: default to Y for
	LARGEFILE
Message-ID: <20150401205855.B975C7F911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f360fec787991a408793f1a676c28f225ad94f38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow us to remove largefile handling in the tree without
breaking things while doing so.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 304afe4..7eb22ce 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,7 @@ source "package/gdb/Config.in.host"
 
 config BR2_LARGEFILE
 	bool
+	default y
 
 config BR2_INET_IPV6
 	bool
