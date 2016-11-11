From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:06:57 +0100
Subject: [Buildroot] [PATCH for-master] package/efl: remove wayland
 dependency
In-Reply-To: <1478854446-3566-1-git-send-email-romain.naour@gmail.com>
References: <1478854446-3566-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161111150657.47ff069c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 09:54:06 +0100, Romain Naour wrote:
> Wayland support requires DRM support in efl libraries since 1.18 bump,
> but this support is not merged yet in Buildroot and waiting for review
> [1].
> 
> For 2016.11, keep wayland support disabled to avoid build issues.
> 
> Fixes:
> http://autobuild.buildroot.net/results/162133cbddcca1ea8be660a19771f04296c20fd2
> 
> [1] http://patchwork.ozlabs.org/patch/671260/
>     http://patchwork.ozlabs.org/patch/671261/

I've applied your patch to master. Could you resend (for next) a new
version of the series that adds DRM support to EFL and the
corresponding Wayland support (probably a revert of this patch?) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
