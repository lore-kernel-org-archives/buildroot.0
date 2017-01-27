From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 19:09:54 +0100
Subject: [Buildroot] [git commit] samba4: update answer cache
Message-ID: <20170127181103.39EC781F86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4348d89d7b2dcf32eb4deb1e878772ac21d15ce0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some toolchain/package combinations require an additional touch (answer)
in the cache file. Fixes:
http://autobuild.buildroot.net/results/426/4266a1690b85bde8da130a84845d1985128bda63/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4-cache.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index c9e34b6..3ba8a75 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -23,6 +23,7 @@ Checking whether setreuid is available: OK
 Checking whether setresuid is available: OK
 Checking whether seteuid is available: OK
 Checking whether fcntl locking is available: OK
+Checking whether fcntl lock supports open file description locks: OK
 Checking for the maximum value of the 'time_t' type: OK
 Checking whether the realpath function allows a NULL argument: OK
 Checking whether POSIX capabilities are available: OK
