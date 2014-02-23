From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:27 +0100
Subject: [Buildroot] [PATCH 01/13] docs/manual: toolchain packages no longer
	use custom makefiles
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/rebuilding-packages.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 88d6670..da8d230 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -69,8 +69,5 @@ files that just tell whether this or that action has been done):
   Buildroot will trigger the recompilation of the package from the
   compilation step (execution of +make+).
 
-Note: toolchain packages use custom makefiles. Their stamp files are named
-differently.
-
 Further details about package special make targets are explained in
 xref:pkg-build-steps[].
-- 
1.8.3.2
