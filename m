From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 11:05:05 +0200
Subject: [Buildroot] [PATCH 6/7 v2] package/xenomai: add hash file
In-Reply-To: <cover.1430557268.git.yann.morin.1998@free.fr>
References: <cover.1430557268.git.yann.morin.1998@free.fr>
Message-ID: <8fb68d0533d212ab2aa69fde9dad94ea508f2123.1430557268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that custom versions are properly excluded from the list, we can add
a hash for the version we package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Also verified the .sig file (against Gilles' unfortunately expired key).
---
 package/xenomai/xenomai.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xenomai/xenomai.hash

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
new file mode 100644
index 0000000..4d74472
--- /dev/null
+++ b/package/xenomai/xenomai.hash
@@ -0,0 +1,2 @@
+# Locally computed;
+sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
-- 
1.9.1
