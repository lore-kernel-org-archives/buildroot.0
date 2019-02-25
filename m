From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Feb 2019 13:47:31 +0100
Subject: [Buildroot] [git commit] package/stress-ng: Fix author email in
 0003-test-test-bsd-wchar-...patch
Message-ID: <20190225124536.906247FDB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7c92f7e12a682bcc335b67e601644187d9fd85f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Author's and sign-off's emails differs, so fix the author's one which
is not valid anymore.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch b/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
index 79d381bc65..931aaff2bd 100644
--- a/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
+++ b/package/stress-ng/0003-test-test-bsd-wchar-Explicitly-include-stdio.h.patch
@@ -1,5 +1,5 @@
 From 291070801245da26e4841c321910b55016ca23c0 Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim.kochan@petcube.com>
+From: Vadim Kochan <vadim4j@gmail.com>
 Date: Tue, 1 Jan 2019 17:24:54 +0200
 Subject: [PATCH] test/test-bsd-wchar: Explicitly include stdio.h
 
