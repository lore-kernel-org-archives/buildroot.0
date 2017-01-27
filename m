From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jan 2017 14:18:42 -0300
Subject: [Buildroot] [PATCH] samba4: update answer cache
Message-ID: <20170127171842.4317-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchain/package combinations require an additional touch (answer)
in the cache file. Fixes:
http://autobuild.buildroot.net/results/426/4266a1690b85bde8da130a84845d1985128bda63/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
