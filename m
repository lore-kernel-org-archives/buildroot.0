From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Nov 2014 12:24:20 +0000
Subject: [Buildroot] [PATCH 1/2] systemd: rename patches to follow the new
	name structure
Message-ID: <1415103861-64413-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...-getty-unit.patch => 0001-fix-getty-unit.patch} |    0
 ...ild-sys-revert-use-of-ln-relative-option.patch} |    0
 ...h => 0003-fix-am-path-libgcrypt-no-found.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/systemd/{systemd-01-fix-getty-unit.patch => 0001-fix-getty-unit.patch} (100%)
 rename package/systemd/{systemd-02-build-sys-revert-use-of-ln-relative-option.patch => 0002-build-sys-revert-use-of-ln-relative-option.patch} (100%)
 rename package/systemd/{systemd-03-fix-am-path-libgcrypt-no-found.patch => 0003-fix-am-path-libgcrypt-no-found.patch} (100%)

diff --git a/package/systemd/systemd-01-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
similarity index 100%
rename from package/systemd/systemd-01-fix-getty-unit.patch
rename to package/systemd/0001-fix-getty-unit.patch
diff --git a/package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch b/package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
similarity index 100%
rename from package/systemd/systemd-02-build-sys-revert-use-of-ln-relative-option.patch
rename to package/systemd/0002-build-sys-revert-use-of-ln-relative-option.patch
diff --git a/package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch b/package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
similarity index 100%
rename from package/systemd/systemd-03-fix-am-path-libgcrypt-no-found.patch
rename to package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
-- 
1.7.1
