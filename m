From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Feb 2019 22:43:44 +0100
Subject: [Buildroot] [git commit] configs/pc: fix grub-efi.cfg permissions
Message-ID: <20190207214424.5F52583F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a3ec5dc2f06c5b86b0c351825255d371051fb9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It does not need the execute bits.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/grub-efi.cfg | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
old mode 100755
new mode 100644
