From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:01:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] boot/at91bootstrap3: fix
 checksum of license
Message-ID: <20210317191341.7C4708820D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=291025426d234348cc0f18ba2e48ad493020a278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Commit ca1604388a86d73c548c6e65eadd13f424685838 updated the checksum of
the tarball, but failed to update the one of main.c, which serves as a
license file.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 71088383869f761e54280d41d844e146da9569b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 6671a4ac70..6b6257b0ab 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
-sha256  732b2a55b5905031d8ae420136ffb5f8889214865784386bf754cffab8d2bc6e  main.c
+sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
