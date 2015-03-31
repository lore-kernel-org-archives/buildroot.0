From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 15:45:34 -0300
Subject: [Buildroot] [PATCH 04/10] matchbox-fakekey: add hash file
In-Reply-To: <1427827540-15836-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427827540-15836-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427827540-15836-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/matchbox/matchbox-fakekey/matchbox-fakekey.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/matchbox/matchbox-fakekey/matchbox-fakekey.hash

diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox/matchbox-fakekey/matchbox-fakekey.hash
new file mode 100644
index 0000000..3e8778a
--- /dev/null
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.hash
@@ -0,0 +1,2 @@
+# From http://downloads.yoctoproject.org/releases/matchbox/libfakekey/0.1/libfakekey-0.1.tar.bz2.md5
+md5	83dbde4d77e8baf0176fe4291d8a2303	libfakekey-0.1.tar.bz2
-- 
2.0.5
