From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:53:20 +0100
Subject: [Buildroot] [git commit] zeromq: drop required openpgm library
	comment
Message-ID: <20160310225323.B93128081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3bb3f0b82b9afd5eef79fb449df68e013cc3175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's obvious, buildroot has it and it's selected/depended upon.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index b75ed3a..c780f25 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -34,6 +34,6 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
 	  implemented either over raw IP packets or UDP datagrams
-	  (encapsulated PGM). This requires OpenPGM library.
+	  (encapsulated PGM).
 
 endif
