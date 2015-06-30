From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:30:53 +0200
Subject: [Buildroot] [git commit] config/raspberrypi: rename our non-DT
	defconfig file
Message-ID: <20150630123122.C746D81796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76b00bde625237c3ad7613c0f37c7739652c8ca5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we no longer have a non-DT defconfig, and we no longer want to
advertise such a possibility (non-DT is being phased out), just rename
the DT-enabled defconfig file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...pberrypi_dt_defconfig => raspberrypi_defconfig} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_defconfig
similarity index 100%
rename from configs/raspberrypi_dt_defconfig
rename to configs/raspberrypi_defconfig
