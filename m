From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:58:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version 2.28
In-Reply-To: <20180803181425.18106-2-romain.naour@gmail.com>
References: <20180803181425.18106-1-romain.naour@gmail.com>
 <20180803181425.18106-2-romain.naour@gmail.com>
Message-ID: <20180809235847.225f0ab5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Aug 2018 20:14:25 +0200, Romain Naour wrote:
> https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/glibc/glibc.hash | 2 +-
>  package/glibc/glibc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks. Please monitor the autobuilders at
http://autobuild.buildroot.net/?branch=next&status=NOK&libc=glibc in
the next few days for build failures related to glibc 2.28, I'm sure
there will be some :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
