From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:28:12 +0200
Subject: [Buildroot] [git commit] argus: add comment mmu depends
Message-ID: <20140804163002.439499D3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dae98e35454232745e08e9904000f5692e4f0292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/argus/Config.in b/package/argus/Config.in
index fe28c77..6d47734 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -12,3 +12,4 @@ config BR2_PACKAGE_ARGUS
 
 comment "argus needs a toolchain w/ threads, IPv6"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6)
+	depends on BR2_USE_MMU
