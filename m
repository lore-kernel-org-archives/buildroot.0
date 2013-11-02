From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 Nov 2013 16:46:57 +0100
Subject: [Buildroot] [PATCH v3 1/2] ngrep: rename existing patch
Message-ID: <1383407218-2770-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ngrep/{ngrep-1.45-make-objs.patch => ngrep-0001-make-objs.patch}  | 0
 .../ngrep/{ngrep-1.45-pcre-header.patch => ngrep-0002-pcre-header.patch}  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/ngrep/{ngrep-1.45-make-objs.patch => ngrep-0001-make-objs.patch} (100%)
 rename package/ngrep/{ngrep-1.45-pcre-header.patch => ngrep-0002-pcre-header.patch} (100%)

diff --git a/package/ngrep/ngrep-1.45-make-objs.patch b/package/ngrep/ngrep-0001-make-objs.patch
similarity index 100%
rename from package/ngrep/ngrep-1.45-make-objs.patch
rename to package/ngrep/ngrep-0001-make-objs.patch
diff --git a/package/ngrep/ngrep-1.45-pcre-header.patch b/package/ngrep/ngrep-0002-pcre-header.patch
similarity index 100%
rename from package/ngrep/ngrep-1.45-pcre-header.patch
rename to package/ngrep/ngrep-0002-pcre-header.patch
-- 
1.8.1.4
