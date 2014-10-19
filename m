From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 19:24:08 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: add hash
Message-ID: <20141019172416.AF8BDAF707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f61f8182a320e2607a51e85d89c0db6b64447340
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
new file mode 100644
index 0000000..947ae23
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a	wpa_supplicant-2.3.tar.gz
