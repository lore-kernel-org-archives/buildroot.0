From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 14:33:40 +0100
Subject: [Buildroot] [git commit] systemd: rename patches to follow the new
	name structure
Message-ID: <20141107133601.17A45B2BF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a2218866d18176abd93e2fe56fd7779982ef393
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-getty-unit.patch => 0001-fix-getty-unit.patch} |    0
 ...ild-sys-revert-use-of-ln-relative-option.patch} |    0
 ...h => 0003-fix-am-path-libgcrypt-no-found.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

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
