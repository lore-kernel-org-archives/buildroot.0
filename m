From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:41:41 +0200
Subject: [Buildroot] [PATCH 2/2] isl: bump to version 0.18
In-Reply-To: <20170801234301.23840-3-yurovsky@gmail.com>
References: <20170801234301.23840-1-yurovsky@gmail.com>
 <20170801234301.23840-3-yurovsky@gmail.com>
Message-ID: <20170802214141.7f8de2a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Aug 2017 16:43:01 -0700, Andrey Yurovsky wrote:
> This is needed by GCC 7.X for graphite support. There's no longer any
> tie to cloog, so remove the comment related to that.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/isl/isl.hash | 2 +-
>  package/isl/isl.mk   | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)

Applied after tweaking the commit log, and removing ISL_LIBTOOL_PATCH =
NO, which was no longer needed.

Also, I've removed the cloog package, which was no longer used anywhere.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
