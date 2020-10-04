From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 20:45:35 +0200
Subject: [Buildroot] [git commit] package/links: fix hash
Message-ID: <20201004190202.D473E8E1BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9da4f0cb478804d55a57e06421c5877a06ee9e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash was not updated by commit d133d33586c9a06d837d5db42a6f9046156034c6

Fixes:
 - http://autobuild.buildroot.org/results/c8333bb3c1abda67dadda203beb9b69fb0e1a080

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 3176653f6f..f941c2cd1b 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424  links-2.21.tar.bz2
+sha256  285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63  links-2.21.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
