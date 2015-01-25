From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:25:12 +0100
Subject: [Buildroot] [git commit] docs: prepare moving the website
Message-ID: <20150125142540.8387D8042A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f0e0d5a8a13b7d6f83db9acd7efda4604c0e850
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/docs/website b/docs/website
new file mode 120000
index 0000000..9c558e3
--- /dev/null
+++ b/docs/website
@@ -0,0 +1 @@
+.
