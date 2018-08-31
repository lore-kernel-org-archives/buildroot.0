From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 30 Aug 2018 23:24:12 -0300
Subject: [Buildroot] [PATCH/next] configs/pc: fix grub-efi.cfg permissions
Message-ID: <20180831022412.2182-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It does not need the execute bits.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 board/pc/grub-efi.cfg | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 board/pc/grub-efi.cfg

diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
old mode 100755
new mode 100644
-- 
2.17.1
