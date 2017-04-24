From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 11:38:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] icu: legal-info: refer to
	the real license file
Message-ID: <20170424193336.5CA53827E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eda38d300b33789985e0259cd5042dbc68971211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

License.html now just contains the string:

The ICU license is now in plain text format, see <a href="./LICENSE">LICENSE</a>.
Update links and software appropriately.

So refer directly to that file instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d2ea2479e5061c9d48b7ee544271828563e83da8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index b9e42de..a435e47 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -8,7 +8,7 @@ ICU_VERSION = 58.2
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
-ICU_LICENSE_FILES = license.html
+ICU_LICENSE_FILES = LICENSE
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
