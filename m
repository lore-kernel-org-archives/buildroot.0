From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Oct 2014 17:03:41 -0300
Subject: [Buildroot] [PATCH 2/5] gnupg: add hash file
In-Reply-To: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412625824-2350-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412625824-2350-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg/gnupg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gnupg/gnupg.hash

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
new file mode 100644
index 0000000..d6733f5
--- /dev/null
+++ b/package/gnupg/gnupg.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b7b5fdda78849955e0cdbc5a085f3a08f8b7fba126c622085debb62def5d6388	gnupg-1.4.18.tar.bz2
-- 
2.0.4
