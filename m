From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:05:54 +0100
Subject: [Buildroot] [PATCH 1/2 v2] docs: prepare moving the website
In-Reply-To: <cover.1422054324.git.yann.morin.1998@free.fr>
References: <cover.1422054324.git.yann.morin.1998@free.fr>
Message-ID: <80599fbbc0b35a4caec0ce971940322c388cd3a3.1422054324.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit just creates a symlink so the website is now accessible from
both docs/ and docs/website/.

This allows us to have the website now officially in docs/website, while
still keep backward compatibility with the current scripts that update
the website. Once those scripts have been updated, we'll be able to truly
move the website to docs/website/ for good.

All without any perceived downtime or missed updated on the website! :-)

After an idea from Peter.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Changes v1 -> v2:
  - fix typo in title  (Thomas DP)
---
 docs/website | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 docs/website

diff --git a/docs/website b/docs/website
new file mode 120000
index 0000000..945c9b4
--- /dev/null
+++ b/docs/website
@@ -0,0 +1 @@
+.
\ No newline at end of file
-- 
1.9.1
