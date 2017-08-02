From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:41:15 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: support grahite for GCC 5 or above
In-Reply-To: <20170801234301.23840-2-yurovsky@gmail.com>
References: <20170801234301.23840-1-yurovsky@gmail.com>
 <20170801234301.23840-2-yurovsky@gmail.com>
Message-ID: <20170802214115.2b5c994d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Aug 2017 16:43:00 -0700, Andrey Yurovsky wrote:
> Dropping graphite support for 4.X (of which only 4.9 remains) enables us
> to build graphite support the modern way (which involves only ISL
> rather than ISL and cloog). Newer versions of GCC require a newer ISL
> which does not work with cloog.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/gcc/Config.in.host | 4 ++++
>  package/gcc/gcc.mk         | 9 +++------
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied after tweaking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
