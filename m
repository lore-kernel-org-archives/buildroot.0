From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Nov 2010 09:19:21 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: LEON SPARC only
	works with gcc-4.4.x
Message-ID: <20101125090730.248F18CA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8de0337f24d2c0fd00ac203079f8054a89cfad68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index d828501..6236439 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -304,6 +304,7 @@ config BR2_sparc_cypress
 	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
+comment "LEON SPARC needs gcc = 4.4.x"
 config BR2_sparc_sparchfleon
 	bool "hfleon"
 config BR2_sparc_sparchfleonv8
-- 
1.7.2.2
