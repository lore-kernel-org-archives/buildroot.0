From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 15:06:18 +0200
Subject: [Buildroot] [PATCH v9 05/15] busybox: selinux support
In-Reply-To: <1436905227-26937-6-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-6-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718150618.285b03cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:17 -0500, Clayton Shotwell wrote:
> Add a configure option to enable the SELinux support in the
> busybox configuration from the Buildroot menuconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> Changes v8 -> v9:
>   - No changes

I've applied the patch. However, could you submit the Busybox patch
upstream?

Also, the Config.in help text mentions
BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES, for which I haven't merged the
patch yet because I still had comments. So we will have to hurry to
merge it, to not keep for too long this currently "invalid" reference!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
