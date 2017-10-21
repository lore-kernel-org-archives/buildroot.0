From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 21 Oct 2017 10:01:08 -0400
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
Message-ID: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During development, it is often practical to have many output
directories.  The output directory is easily specified with O=<output>
though is it useful to have a convention of 'output...' e.g.
"output-rpi", "output-rpi2", and "output-rpi3-64".

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..ec5768d053 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,4 @@
-/output
+/output*
 /dl
 /.auto.deps
 /.config.cmd
-- 
2.14.2
