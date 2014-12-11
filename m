From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 19:51:25 +0100
Subject: [Buildroot] [git commit] libsvgtiny: rename patches to follow the
	new name convention
Message-ID: <20141211190139.0C9418002D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a54105160c2eb01fe4ef19bedb676e583acaa72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ntfs.patch => 0001-disable-debug-printfs.patch} |    0
 ...e-builddir.patch => 0002-create-builddir.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch b/package/libsvgtiny/0001-disable-debug-printfs.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch
rename to package/libsvgtiny/0001-disable-debug-printfs.patch
diff --git a/package/libsvgtiny/libsvgtiny-02-create-builddir.patch b/package/libsvgtiny/0002-create-builddir.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-02-create-builddir.patch
rename to package/libsvgtiny/0002-create-builddir.patch
