From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:51:36 +0200
Subject: [Buildroot] [PATCH 1/1] opencv3: enable pthreads parallel for
 loops
In-Reply-To: <20170929204724.25507-1-bradford@density.io>
References: <20170929204724.25507-1-bradford@density.io>
Message-ID: <20171012225136.3a92bb33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 16:47:24 -0400, Bradford Barr wrote:
> From: bradford barr <bradford@density.io>
> 
> The WITH_PTHREADS_PF option was errantly categorized as a Windows only option.
> WITH_PTHREADS_PF actually enables a parallelization framework that utilizes
> pthreads to optimize some inner for loops of different OpenCV operations. This
> optimization is available on any platform that has pthreads.
> 
> Signed-off-by: bradford barr <bradford@density.io>
> ---
>  package/opencv3/opencv3.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
