From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 22:46:11 +0200
Subject: [Buildroot] [PATCH 1/2] docs: prepare mmoving the website
In-Reply-To: <cover.1411591300.git.yann.morin.1998@free.fr>
References: <cover.1411591300.git.yann.morin.1998@free.fr>
Message-ID: <421f71023741fce23ea58ce3dbad2310ba1310f4.1411591300.git.yann.morin.1998@free.fr>
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
