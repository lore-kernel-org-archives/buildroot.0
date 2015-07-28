From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:56:28 +0200
Subject: [Buildroot] [PATCH] uclibc: arc-2015.06 - add patches on top of
 release
In-Reply-To: <1438090353-30077-1-git-send-email-abrodkin@synopsys.com>
References: <1438090353-30077-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150728225628.75551af2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 28 Jul 2015 16:32:33 +0300, Alexey Brodkin wrote:
> This commit adds 2 patches on top of arc-2015.06 release:
>  0001-nptl-remove-duplicate-vfork-in-libpthread.patch
>  0002-ARCv2-update-memset-so-it-could-be-used-without-doub.patch
> 
> The first patch fixes multiple build issues when using static build like
> http://autobuild.buildroot.net/results/b704016acfa38e7998739a2c70bcf6020c59bda8/
> 
> The second patch allows for building uClibc for ARCv2 based CPUs that
> doesn't have 64-bit load/store capabilities.
> 
> Both patches should be a part of the next release/update of ARC GNU
> tools so then they should be removed from Buildroot.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...nptl-remove-duplicate-vfork-in-libpthread.patch | 722 +++++++++++++++++++++
>  ...e-memset-so-it-could-be-used-without-doub.patch |  81 +++
>  2 files changed, 803 insertions(+)
>  create mode 100644 package/uclibc/arc-2015.06/0001-nptl-remove-duplicate-vfork-in-libpthread.patch
>  create mode 100644 package/uclibc/arc-2015.06/0002-ARCv2-update-memset-so-it-could-be-used-without-doub.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
