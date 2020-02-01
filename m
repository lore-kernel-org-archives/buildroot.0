From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Feb 2020 10:23:24 +0100
Subject: [Buildroot] [PATCH] support: expand the legal-info header
Message-ID: <20200201092324.6785-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make it explicit that the content of legal-info is a best-effort, and
that the Buildroot developpers make no guarantee that it is correct.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/legal-info/README.header | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 55996b5303..050b093537 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -33,3 +33,7 @@ This material is composed of the following items.
    'host-licenses/' subdirectories for target and host packages
    respectively.
 
+Note that the Buildroot developers provide no guarantee as to whether the
+information contained in the material thus collected, is correct or
+exhaustive, or both. It is your responsibility, as part of your compliance
+process, to verify the correctness and exhaustivity of that information.
-- 
2.20.1
