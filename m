From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:05:18 +0200
Subject: [Buildroot] [git commit] .flake8: add config file for Python code
	style
Message-ID: <20171006165925.B663280489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=918a02ce224c0adf7dda3531df8a68d6a556b30a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We recommend wrapping at 80 columns but we accept 132 columns when it
makes more readable.

Follow up of discussion at this thread:
http://lists.busybox.net/pipermail/buildroot/2017-October/203624.html

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .flake8 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.flake8 b/.flake8
new file mode 100644
index 0000000..afdb967
--- /dev/null
+++ b/.flake8
@@ -0,0 +1,2 @@
+[flake8]
+max-line-length=132
