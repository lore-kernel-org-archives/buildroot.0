From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Sep 2013 09:45:56 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper: minor code style fixup
Message-ID: <20130923074622.52ADC9B846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9558e023055f14860a5e2b5cc5ff36c76c78daa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed from 60cb290475c (add option to print one argument per line).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index dfdfcff..727e322 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -170,7 +170,7 @@ int main(int argc, char **argv)
 			fprintf(stderr, "Toolchain wrapper executing:");
 			for (i = 0; args[i]; i++)
 				fprintf(stderr, "%s'%s'",
-					(debug == 2)?"\n    ":" ", args[i]);
+					(debug == 2) ? "\n    " : " ", args[i]);
 			fprintf(stderr, "\n");
 		}
 	}
