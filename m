From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 28 Jan 2014 22:37:06 +1300
Subject: [Buildroot] [PATCH] tcpreplay: Bump version to 4.0.2
In-Reply-To: <8761p5zek2.fsf@dell.be.48ers.dk>
References: <8761p5zek2.fsf@dell.be.48ers.dk>
Message-ID: <1390901826-2954-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
On 28/01/14 03:26, Peter Korsgaard wrote:
> 
> A patch to bump the version would be good as well, thank.
> 

Here you go. I've heard back from upstream, the maintainer is dealing with some
family issues so the patch from my pull request will do for now. Build tested
with/without BR2_PACKAGE_TCPDUMP.

 package/tcpreplay/tcpreplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index a2cd16e..fdb42a5 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.0.0
+TCPREPLAY_VERSION = 4.0.2
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
1.8.4.rc2
