From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:29 +0100
Subject: [Buildroot] [PATCH 16/16 v5] legal-info: explicitly state how
	patches are licensed
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <d6c5a79915775eaa9d1a6d1711a4955cafe221cd.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/legal-info/README.header | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 418de14..feee104 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -18,7 +18,7 @@ This material is composed of the following items.
    sources/ subdirectory (except for the non-redistributable packages, which
    have not been saved). Patches that were applied are also saved, along
    with a file named 'series' that lists the patches in the order they were
-   applied.
+   applied. Patches are under the same license as the original package.
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
-- 
1.9.1
