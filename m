From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 12:18:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-09-09
In-Reply-To: <54101CB6.6010804@imgtec.com>
References: <20140910063013.732CF1018B1@stock.ovh.net>
 <54101CB6.6010804@imgtec.com>
Message-ID: <20140910121800.3b074cec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Sep 2014 10:41:10 +0100, Vicente Olivert Riera wrote:
> On 09/10/2014 07:30 AM, Thomas Petazzoni wrote:
> > Build statistics for 2014-09-09
> > ===============================
> 
> >      mipsel |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/f2639fc59b8ba452cf95268b6370c1093bf4aaef/
> 
> The problem is explained here:
> 
> [PATCH] libdl.c: static link fail for mips
> http://lists.uclibc.org/pipermail/uclibc/2013-April/047708.html
> 
> Upstream uClibc is fixed, but as fas as I know Buildroot's policy is to 
> not accept more patches to uClibc.

That's not true. We try to not add *feature* patches. Fixes are
perfectly fine, and we already have 50+ patches.

> The problem we are having with this is that certain parts of libarchive 
> build statically although you are doing a dynamic build. We can avoid 
> those parts to build statically using the patch I sent few days ago:
> 
> http://patchwork.ozlabs.org/patch/384234/

Peter, could you apply this patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
