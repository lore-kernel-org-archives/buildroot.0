From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 20:11:52 +0200
Subject: [Buildroot] [git commit] package/libgdiplus: bump version to 6.0.5
Message-ID: <20210411180008.A01B77FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a363384cff08fd8380c88bef0238875e0685328b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches applied upstream.

Add patch to not build unit tests by default (patch sent upstream):

https://github.com/mono/libgdiplus/pull/701

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tests-only-when-enable-unit-tests-is-pass.patch |   53 +
 ...icense-texts-in-LICENSE-like-on-Mono-repo.patch | 1863 --------------------
 ...NSE-to-match-the-headers-of-the-source-fi.patch | 1018 -----------
 ...Include-copy-of-GifQuantizeBuffer-functio.patch |  414 -----
 package/libgdiplus/libgdiplus.hash                 |    2 +-
 package/libgdiplus/libgdiplus.mk                   |    2 +-
 6 files changed, 55 insertions(+), 3297 deletions(-)

Patch is too large, so refusing to show it
