From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:09:23 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/mraa: renumber
 patch
Message-ID: <20201010195947.3810282D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec050315db73f27ad7d7569e85e2ba85515afaaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Commit fd5376a39d079cc5aa26d67788a0c32d234f2f96 wrongly named the patch
as 0002-x.patch instead of 0001-x.patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 17ff9a31cec0654c0adc21420f220eecc989e5a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-extern.patch => 0001-include-Declare-gVERSION-global-as-extern.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
similarity index 100%
rename from package/mraa/0002-include-Declare-gVERSION-global-as-extern.patch
rename to package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
