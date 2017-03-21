From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:02 +0100
Subject: [Buildroot] [git commit] linux-firmware: correct hash
Message-ID: <20170321221730.208FF802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0409b136985ff582d561076f03685da9890fa325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linux-firmware was bumped to 6d3bc8886 in commit 3ff5896ff, a hash
file was added but the hash was wrong. This wasn't noticed before since
hashes are not checked for git downloads.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index e8ee2b7..1646039 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 256378564e36b8f222adb8fbe746529e73413c6cbe2b0e5574f41dfd62d92577 linux-firmware-6d3bc8886517d171068fd1263176b8b5c51df204.tar.gz
+sha256 1cd14477a392fe8c7c44e62623b85466df90ed72a55ae213b637e1c4335739fd linux-firmware-6d3bc8886517d171068fd1263176b8b5c51df204.tar.gz
