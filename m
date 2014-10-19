From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:48 +0200
Subject: [Buildroot] [git commit] cifs-utils: add hash
Message-ID: <20141019153637.95336AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=696d63b461e968a30ffcf3763fcd4b6634cfdeb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cifs-utils/cifs-utils.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
new file mode 100644
index 0000000..9255179
--- /dev/null
+++ b/package/cifs-utils/cifs-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	38fc63926af435dae4ebcf4406275580a692d9fb9ee3e32170317cf2ba68e6e3	cifs-utils-6.4.tar.bz2
