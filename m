From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 01:34:08 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: change the name of the tmp dir
 to be consistent
In-Reply-To: <1436820748-30551-1-git-send-email-arnout@mind.be>
References: <1436820748-30551-1-git-send-email-arnout@mind.be>
Message-ID: <20150714013408.5cc99bda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 22:52:28 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Currently, the generated rootfs will be called rootfs.iso9660, but the
> temporary directory we create while building it is called
> rootfs-iso9660.tmp. They are in different directories so it's not so
> obvious, but still to be consistent it's better to call the temp dir
> rootfs.iso9660.tmp.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  fs/iso9660/iso9660.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
