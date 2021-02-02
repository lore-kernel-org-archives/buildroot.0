From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 2 Feb 2021 20:49:11 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Config.in.legacy: remove
 redundant empty line
Message-ID: <20210202192919.B616285AB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0690e290efc6baef9ae3747945f587e3e9c1afcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

As reported by check-package.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1003084344

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 59a37b708f..428c85bf66 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -156,7 +156,6 @@ config BR2_PACKAGE_LIBUPNP18
 	  CVE-2020-12695. The libupnp package (which has been updated to
 	  version 1.14.x) has been selected instead.
 
-
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto package removed"
 	select BR2_LEGACY
