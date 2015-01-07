From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:37:21 +0100
Subject: [Buildroot] [PATCH v3] linux: hide custom patches when using a
 local tree
In-Reply-To: <1420665328-2704-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1420665328-2704-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150107223721.3a6aab88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Wed,  7 Jan 2015 16:15:28 -0500, Vivien Didelot wrote:
> When using a custom local tree, we're using the OVERRIDE_SRCDIR
> internally, which means we do not apply patches. Since this is the
> expected behavior, make BR2_LINUX_KERNEL_PATCH and
> BR2_LINUX_KERNEL_CUSTOM_LOCAL options exclusive.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  linux/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
