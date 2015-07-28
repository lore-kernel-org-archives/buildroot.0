From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:14 +0200
Subject: [Buildroot] [git commit branch/next] dmidecode: add hash file
Message-ID: <20150808105648.E058F818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55b801957e90ece30d918be39cf6755b9fa5d077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmidecode/dmidecode.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
new file mode 100644
index 0000000..7098ed0
--- /dev/null
+++ b/package/dmidecode/dmidecode.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5a8214b99c1762f4510bd92baa279336e5fed6e5cd2e418d46d95a4ecc783922	dmidecode-2.12.tar.gz
