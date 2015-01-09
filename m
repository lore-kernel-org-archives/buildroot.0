From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 13:26:19 +0100
Subject: [Buildroot] [git commit] xz: fix stray hash
Message-ID: <20150109122634.9C20E800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d81bf795734c94fc3e35ba17a4991fce11359e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/xz.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index f76b9ac..9a5a9ff 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  5962fe32e0b42c7065b4410b7d8ffbf2895e197e97d410c4fc374ea0d7610a14  xz-5.2.0.tar.xz
+sha256  f7357d7455a1670229b3cca021da71dd5d13b789db62743c20624bdffc9cc4a5  xz-5.2.0.tar.bz2
