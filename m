From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: force -fno-stack-protector in
 CPPFLAGS
In-Reply-To: <20180419083659.22462-2-tarek_el-sherbiny@waters.com>
References: <20180419083659.22462-1-tarek_el-sherbiny@waters.com>
 <20180419083659.22462-2-tarek_el-sherbiny@waters.com>
Message-ID: <20180419233232.2eabba59@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 09:36:59 +0100, tarek_el-sherbiny at waters.com wrote:
> From: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>
> 
> The last commit which implements this workaround is now broken by
> commit 20a4583ebf7fe97ea22a1ea11621dd44a8114ca5
> This commit will force no-stack-protector in CPPFLAGS instead of
> CFLAGS to work with buildroot 2018_02
> 
> Signed-off-by: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>
> ---
>  boot/grub2/grub2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, I've applied, after reworking a bit the commit log, and adding
a reference to your bug report.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
