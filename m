From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:46:40 +0200
Subject: [Buildroot] [PATCH 8/7] package/xenomai: add hash file
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <1430261200-20963-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that custom versions are properly excluded from the list, we can add
a hash for the version we package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
