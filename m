From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:23:29 +0200
Subject: [Buildroot] [PATCH] gcc: rename option for ARC gcc
In-Reply-To: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160920212329.46f33940@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Aug 2016 15:25:38 +0200, Thomas Petazzoni wrote:
> The ARC gcc version is now based on gcc 6.x and no longer gcc 4.8.x,
> which makes the option BR2_GCC_VERSION_4_8_ARC a bit irrelevant, as is
> the prompt of this option.
> 
> This commit therefore renames this option to BR2_GCC_VERSION_ARC, and
> adjust its prompt as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in.legacy                       |  7 +++++++
>  package/gcc/Config.in.host             | 10 +++++-----
>  package/gcc/gcc-initial/gcc-initial.mk |  2 +-
>  3 files changed, 13 insertions(+), 6 deletions(-)

I've applied to master, after taking into account the comments made by
Arnout and Baruch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
