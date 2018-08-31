From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 30 Aug 2018 23:51:55 -0300 (BRT)
Subject: [Buildroot] [PATCH/next] configs/pc: fix grub-efi.cfg
 permissions
In-Reply-To: <20180831022412.2182-1-casantos@datacom.com.br>
References: <20180831022412.2182-1-casantos@datacom.com.br>
Message-ID: <249674226.3791227.1535683915719.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "DATACOM" <casantos@datacom.com.br>
> To: "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, August 30, 2018 11:24:12 PM
> Subject: [Buildroot] [PATCH/next] configs/pc: fix grub-efi.cfg permissions

> It does not need the execute bits.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> board/pc/grub-efi.cfg | 0
> 1 file changed, 0 insertions(+), 0 deletions(-)
> mode change 100755 => 100644 board/pc/grub-efi.cfg
> 
> diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
> old mode 100755
> new mode 100644
> --
> 2.17.1

I could not find this one on patchwork. Got lost?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
