From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 Nov 2014 19:31:15 +0100
Subject: [Buildroot] [PATCH v3 4/4] evemu: add hash
In-Reply-To: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
References: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415989875-22535-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v1:
  - change hash and hash upstream url (thanks to Vicente Olivert
    Riera for suggestion and investigation, see [1] and [2])

Changes v1 -> v2:
  - no changes

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112100.html
[2] http://lists.freedesktop.org/archives/input-tools/2014-November/001125.html
---
 package/evemu/evemu.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/evemu/evemu.hash

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
new file mode 100644
index 0000000..99668b7
--- /dev/null
+++ b/package/evemu/evemu.hash
@@ -0,0 +1,2 @@
+# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001125.html
+sha256 0c87360882751356e9f977ebf7438c00fe97deb232ac725dd86e5ba78203ee97 evemu-2.1.0.tar.xz
-- 
1.8.1.4
