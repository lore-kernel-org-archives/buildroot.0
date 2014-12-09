From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 Dec 2014 11:51:18 +0000
Subject: [Buildroot] [PATCH 0/3] slang: fix static builds
Message-ID: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Rename current patches to follow the new name convention.
- Adapt upstream patches to allow building only the static library and a
  static version of slsh.
- Use specific build and install commands when doing static builds.

Vicente Olivert Riera (3):
  slang: rename patches to follow the new name convention
  slang: add adapted upstream patches for static builds
  slang: use specific build and install commands for static builds

 ...ang-01-slsh-libs.patch => 0001-slsh-libs.patch} |    0
 ...nable-a-statically-linked-version-of-slsh.patch |  120 ++++++++++++++++++++
 ...-in-the-statically-linked-version-of-slsh.patch |  114 +++++++++++++++++++
 package/slang/slang.mk                             |    6 +
 4 files changed, 240 insertions(+), 0 deletions(-)
 rename package/slang/{slang-01-slsh-libs.patch => 0001-slsh-libs.patch} (100%)
 create mode 100644 package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
 create mode 100644 package/slang/0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
