From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] softether: don't download patch from Github
Message-ID: <20170702220305.04D0581EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74a56295c1d5133edccea7de4e8ab097f58ca678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 1879 ++++++++++++++++++++
 ...eate-libsoftether.so-and-dynamically-link.patch |  133 ++
 ...atch => 0003-use-fhs-install-directories.patch} |    0
 ...rking-softetherd-for-upstart-and-systemd.patch} |    0
 ...eDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch} |    0
 ...ross-compile.patch => 0006-cross-compile.patch} |    0
 .../{0005-iconv.patch => 0007-iconv.patch}         |    0
 .../{0006-librt.patch => 0008-librt.patch}         |    0
 ...onfig.patch => 0009-uclibc-ai-addrconfig.patch} |    0
 package/softether/softether.hash                   |    2 -
 package/softether/softether.mk                     |    3 -
 11 files changed, 2012 insertions(+), 5 deletions(-)

Patch is too large, so refusing to show it
