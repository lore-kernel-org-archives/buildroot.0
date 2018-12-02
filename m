From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] util-linux: bump to version 2.33
Message-ID: <20181202071554.578B98A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbb68d79732d59a5c3687b20a86602ce0987aaf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update "basic set" help to include the new "choom" utility.
- Re-generate checksums for license files, whose names now follow the
  SPDX License List.
- Pull a patch already applied upstream that make rtcwake use poweroff
  if shutdown is not found (e.g. Busybox, which the default init system
  on Buldroot).
- Pull a patch already submitted upstream to fix the output of escaped
  characters by agetty.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ake-use-poweroff-if-shutdown-is-not-found.patch | 86 ++++++++++++++++++++++
 ...2-agetty-fix-output-of-escaped-characters.patch | 26 +++++++
 package/util-linux/Config.in                       |  2 +-
 package/util-linux/util-linux.hash                 | 14 ++--
 package/util-linux/util-linux.mk                   | 11 ++-
 5 files changed, 128 insertions(+), 11 deletions(-)

Patch is too large, so refusing to show it
