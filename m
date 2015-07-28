From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:12 +0200
Subject: [Buildroot] [git commit branch/next] rpm: add hash file
Message-ID: <20150808105648.2EE057FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0ab9fb325f1171b5eeabc6d11bffb6536d7a17e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/rpm.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
new file mode 100644
index 0000000..0665746
--- /dev/null
+++ b/package/rpm/rpm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	34a959c0ed670cadcdc52c6025e822fac6f5d1015e3b75123f53ebe53b923e98	rpm-5.2.0.tar.gz
