From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 08:35:06 +0200
Subject: [Buildroot] [git commit] linux-firmware: fix tarball hash
Message-ID: <20181001063753.0C62980584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4302c89e6c38db66f43bb783d9a9d09cd3538b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8f6116799dcf9991e5e5253b404506b1439e0a7b/
http://autobuild.buildroot.net/results/d10/d10102bd728e368389ebef8eda7a3eb75caa7d4f/

Commit e14102c6f2f6eb31844 (linux-firmware: bump version and fix hash)
updated the git revision but used an invalid hash, causing download
failures.

Use the correct hash instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index d8fdf77016..ba0de28848 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 8f419b5d0c65d0f861a2cfc634f30e7952135de71a3ebe6b7afbda091f5a94ba linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
+sha256 b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916 linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 4b3ea5d5a03c0db81bee0bcb14b30d75b30ef568597bb5be7d4dee57f434265f LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
