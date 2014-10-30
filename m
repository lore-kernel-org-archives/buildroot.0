From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:32:48 +0100
Subject: [Buildroot] [PATCH 1/2] arch: sparc: Add leon3 cpu type and
 remove sparc{s, h}fleon{, v8}
In-Reply-To: <1414657776-32427-2-git-send-email-andreas@gaisler.com>
References: <1414657776-32427-1-git-send-email-andreas@gaisler.com>
 <1414657776-32427-2-git-send-email-andreas@gaisler.com>
Message-ID: <20141030213248.02a6b3d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Larsson,

On Thu, 30 Oct 2014 09:29:35 +0100, Andreas Larsson wrote:
> There is support for -mcpu=leon3 from gcc 4.8.3. Use this for LEON systems
> instead of the non-mainline targets sparcsfleon, sparchfleon, sparcsfleonv8, and
> sparchfleonv8.
> 
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  arch/Config.in.sparc                   |   15 +-
>  package/gcc/4.4.7/950-sparc-leon.patch |  239 --------------------------------
>  package/gcc/Config.in.host             |   19 +--
>  3 files changed, 9 insertions(+), 264 deletions(-)
>  delete mode 100644 package/gcc/4.4.7/950-sparc-leon.patch

I've added some Config.in.legacy handling for the removed options, and
committed your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
