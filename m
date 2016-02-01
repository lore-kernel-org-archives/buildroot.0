From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 23:19:56 +0100
Subject: [Buildroot] [PATCH v2 5/5] legal-info: explicitly state how patches
	are licensed
In-Reply-To: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1454365196-26319-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/legal-info/README.header | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 0b5aa66..316f799 100644
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
