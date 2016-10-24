From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 15:46:51 +0200
Subject: [Buildroot] [PATCH] uclibc: fix pthread.h
In-Reply-To: <20161024032151.GA7530@waldemar-brodkorb.de>
References: <20161024032151.GA7530@waldemar-brodkorb.de>
Message-ID: <20161024154651.5f68652a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 05:21:51 +0200, Waldemar Brodkorb wrote:
> Fixes:
>  bfin: http://autobuild.buildroot.net/results/fbf/fbf63bbe0974b490b875a95fb930ba601364b85a/
>  m68k: http://autobuild.buildroot.net/results/cc9/cc9b87c4c695f97a056cc53f19e7662750dffeff/
>  microblazeel: http://autobuild.buildroot.net/results/941/941c06e29f6542e258f20799dc6f3f94b2f8af88/
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
>  .../0001-linuxthreads-add-back-signal.h.patch      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/uclibc/0001-linuxthreads-add-back-signal.h.patch

Applied to master, thanks. I've already started rebuilding the m68k,
microblaze and blackfin toolchains with this fix.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
