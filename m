From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Mar 2014 22:02:03 -0300
Subject: [Buildroot] [PATCH] samba4: move x86_64 answer cache file
Message-ID: <1393894923-15986-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The x86_64 answer cache file from commit
d191d40e3fd8cef7fbf3168fdc261de8d4b114fd was intended for a previous
draft version of the samba4 package that resided in a different
directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/{samba => }/samba4/x86_64-cache.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/{samba => }/samba4/x86_64-cache.txt (100%)

diff --git a/package/samba/samba4/x86_64-cache.txt b/package/samba4/x86_64-cache.txt
similarity index 100%
rename from package/samba/samba4/x86_64-cache.txt
rename to package/samba4/x86_64-cache.txt
-- 
1.8.3.2
