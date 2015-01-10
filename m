From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:39:02 +0100
Subject: [Buildroot] [PATCH v2 1/8] boot/uboot: Remove obsolete
 CONFIG_NOSOFTFLOAT flag
In-Reply-To: <1420897647-25001-2-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
 <1420897647-25001-2-git-send-email-jkrause@posteo.de>
Message-ID: <20150110163902.2e3a8d9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 10 Jan 2015 14:47:20 +0100, J?rg Krause wrote:
> This flag seems to be obsolete. There is no piece of code in the U-Boot source
> tree referencing CONFIG_NOSOFTFLOAT.
> 
> Unfortunatly the use of this flag is not documented here. Maybe it's about this
> old workaround:
> http://lists.denx.de/pipermail/u-boot/2007-March/020282.html
> 
> However, this patch has been declined:
> http://www.denx.de/wiki/view/U-Boot/PatchStatus?rev=1.27
>   
> Since no other configure options are used, remove also UBOOT_CONFIGURE_OPTS.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
