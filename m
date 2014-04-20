From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 12:16:42 +0200
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
In-Reply-To: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
References: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <20140420121642.2fe33bb7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Wed, 20 Nov 2013 23:33:28 +0100, Thierry Bultel wrote:
> When building stage2 with binutils >= 2.19.1, grub says it is corrupted
> I have not tried to downgrade binutils to that version, since buildroot
> offers 2.20.1 as oldest. The issue was reproduced with 2.23.2.
> 
> The following patch is clearly not mine.
> I have found it at that location https://dev.openwrt.org/ticket/10444
> where the issue is described, and the patch offered.
> 
> Successfully tested with an iso image in kvm, that else would hang on 
> "Loading stage2 ..."
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
> ---
>  boot/grub/grub.500-add-stage2-ldscripts.patch |   58 +++++++++++++++++++++++++
>  1 files changed, 58 insertions(+), 0 deletions(-)
>  create mode 100644 boot/grub/grub.500-add-stage2-ldscripts.patch

As our discussion has shown, this patch is in fact not necessary. I've
consequently marked it as Rejected in patchwork. Do not hesitate to let
me know if you still have unsolved issues with grub.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
