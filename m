From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 18:00:55 +0200
Subject: [Buildroot] [PATCH v2] Fix building initramfs kernel with
 appended dtb
In-Reply-To: <1375285656-24907-1-git-send-email-nford@westpond.com>
References: <1375285656-24907-1-git-send-email-nford@westpond.com>
Message-ID: <20130801180055.3875450d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathan Ford,

On Wed, 31 Jul 2013 11:47:36 -0400, Nathan Ford wrote:
> The target for building the kernel with a cpio initramfs is not
> calling the append dtb commands, creating a final kernel image
> without an appended dtb. Instead it needs to call kernel make on
> the intermediate target, then call the append dtb commands
> to produce the final image as the primary kernel build target
> does.
> 
> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  linux/linux.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
