From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 09:20:24 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/qemu: move patch
 3 to the 3.1.1.1 subdir
Message-ID: <20191030085440.851F17F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=771511f6380901ec1e8af1865d149c1fd01977c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Required since the bump from 3.1.1.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ef6d39565cc6bc0ba55b3ffcb44dda14e20232c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
similarity index 100%
rename from package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
rename to package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
