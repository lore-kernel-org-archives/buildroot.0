From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:02:11 +0100
Subject: [Buildroot] [git commit] eudev: avoid patches with identical
	sequence numbers
Message-ID: <20150309130335.D550D80E5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cadeb9c2503620c24a3bfba55f2048f3b33f71d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 7b4fca6697d9ede0c85e2454eba1c6d13603b5a3 ("eudev: fix
mkstemp/mkostemp related build failure"), we had two patches with
sequence number 0001, which is not great. This commit fixes that by
setting one of the sequence number to 0002.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fix-mkstemp-mkostemp-related-build-failu.patch} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch b/package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
similarity index 100%
rename from package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
rename to package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
