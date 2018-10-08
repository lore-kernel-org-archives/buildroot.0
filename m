From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:46:33 +0200
Subject: [Buildroot] [PATCH] qemu: security bump to 2.12.1
In-Reply-To: <20181008070842.25883-1-peter@korsgaard.com>
References: <20181008070842.25883-1-peter@korsgaard.com>
Message-ID: <20181008174633.289720b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 09:08:42 +0200, Peter Korsgaard wrote:
> From the release notes:
> 
> This update contains new mitigation functionality for CVE-2018-3639
> (Speculative Store Bypass) in x86. There are also bug fixes for
> migration, Intel IOMMU emulation, block layer/image handling, ARM
> emulation, and various other areas.
> 
> https://www.mail-archive.com/qemu-devel at nongnu.org/msg553574.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
