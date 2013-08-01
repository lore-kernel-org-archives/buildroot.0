From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 18:01:46 +0200
Subject: [Buildroot] [PATCH] Install DTB as part of images install
 command
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
References: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
Message-ID: <20130801180146.29167afe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Reuben Dowle,

On Wed, 27 Mar 2013 23:01:15 +0000, Reuben Dowle wrote:
> From: Reuben Dowle <reuben.dowle@4rf.com>
> 
> When installing DTB to the images directory, do this as part of the image
> install commands rather than the target install commands.
> 
> Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com.az>
> ---
>  linux/linux.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
