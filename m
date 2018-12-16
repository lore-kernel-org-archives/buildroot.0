From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:09:27 +0100
Subject: [Buildroot] [git commit] package/libgdiplus: bump to version 5.6
Message-ID: <20181216200541.3370A83FAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8969cf2ffbe78eb1215a1c106ea05bfd1f2f383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of this bump, we backport two upstream patches that fix the
license text to really reflect the license of the project. The second
patch was prompted by a bug report made by Arnout Vandecappelle
(https://github.com/mono/libgdiplus/issues/375), following a
discussion on the Buildroot mailing list. The first patch is needed as
a dependency of this first patch. Since both patches are upstream,
they can be dropped during the next version bump.

So now, the license text is the one of the MIT license, which matches
the header comments in all source files, making the comment about the
<pkg>_LICENSE variable in libgdiplus.mk irrelevant. The hash of the
license file is updated as well.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: update licensing aspects.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...icense-texts-in-LICENSE-like-on-Mono-repo.patch | 1863 ++++++++++++++++++++
 ...NSE-to-match-the-headers-of-the-source-fi.patch | 1018 +++++++++++
 package/libgdiplus/libgdiplus.hash                 |    3 +-
 package/libgdiplus/libgdiplus.mk                   |    8 +-
 4 files changed, 2885 insertions(+), 7 deletions(-)

Patch is too large, so refusing to show it
