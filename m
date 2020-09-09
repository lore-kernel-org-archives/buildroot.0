From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2020 22:38:43 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/mongrel2:
 renumber patches
Message-ID: <20200909203533.76E15813DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c14cc15882886a7825b4c479bd0795753536e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4013e9153a1116507657b08e7a20e21599ee3ab7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../mongrel2/{0002-Do-not-run-tests.patch => 0001-Do-not-run-tests.patch} | 0
 ...s-compilation.patch => 0002-Fix-Makefiles-for-cross-compilation.patch} | 0
 ...revent-conflict.patch => 0003-Rename-symbol-to-prevent-conflict.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/mongrel2/0002-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
similarity index 100%
rename from package/mongrel2/0002-Do-not-run-tests.patch
rename to package/mongrel2/0001-Do-not-run-tests.patch
diff --git a/package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
similarity index 100%
rename from package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch
rename to package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
diff --git a/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch b/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
similarity index 100%
rename from package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch
rename to package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
