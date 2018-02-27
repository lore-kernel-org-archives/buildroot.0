From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:37 -0600
Subject: [Buildroot] [NEXT 22/26] openssh: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-23-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/openssh/openssh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6b7ac22..d01d8f5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -8,6 +8,8 @@ OPENSSH_VERSION = 7.6p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
+OPENSSH_CPE_ID = openbsd:$(OPENSSH_NAME):$(OPENSSH_VERSION)
+
 # Autoreconf needed due to the following patches modifying configure.ac:
 # 0001-configure-ac-detect-mips-abi.patch
 # 0002-configure-ac-properly-set-seccomp-audit-arch-for-mips64.patch
-- 
1.9.1
