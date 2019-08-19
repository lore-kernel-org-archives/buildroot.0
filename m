From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 19 Aug 2019 11:00:38 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 3/3] web/func.inc.php: add a
 link to the request page in the footer
In-Reply-To: <20190819090038.28808-1-victor.huesca@bootlin.com>
References: <20190819090038.28808-1-victor.huesca@bootlin.com>
Message-ID: <20190819090038.28808-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to access the new request page from the footer.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/funcs.inc.php | 1 +
 1 file changed, 1 insertion(+)

diff --git a/web/funcs.inc.php b/web/funcs.inc.php
index e3fb577..80130f8 100644
--- a/web/funcs.inc.php
+++ b/web/funcs.inc.php
@@ -24,6 +24,7 @@ function bab_footer()
   echo "<a href=\"stats.php\">build stats</a>&nbsp;-&nbsp;";
   echo "<a href=\"stats/\">package stats</a>&nbsp;-&nbsp;";
   echo "<a href=\"toolchains/\">toolchain configs</a>&nbsp;-&nbsp;";
+  echo "<a href=\"request\">advanced search</a>&nbsp;-&nbsp;";
   echo "<a href=\"http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build\">Script to reproduce a build</a>\n";
   echo "</p>\n";
   echo "</body>\n";
-- 
2.21.0
