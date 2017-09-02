From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:14:53 +0200
Subject: [Buildroot] [PATCH] configs/galileo: CONFIG_LBDAF=y
In-Reply-To: <20170902081032.24935-1-sielicki@yandex.com>
References: <20170902081032.24935-1-sielicki@yandex.com>
Message-ID: <20170902201453.56769f56@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 03:10:32 -0500, Nicholas Sielicki wrote:
> Kernel help-text states, "The ext4 filesystem requires that this feature
> be enabled <...> otherwise, it will refuse to mount in the read-write
> mode any filesystems that use the huge_file feature, which is enabled by
> default by mke2fs.ext4."
> 
> If the rootfs is to be (re)mounted rw at boot, this must be set for the
> system to successfully come up.
> 
> Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
> ---
>  board/intel/galileo/linux-3.14.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
