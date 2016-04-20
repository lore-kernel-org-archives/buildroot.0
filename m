From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:05:08 +0200
Subject: [Buildroot] [PATCH] gcc: disable split-stack for non-thread
 builds
In-Reply-To: <20160307141028.GA31754@waldemar-brodkorb.de>
References: <20160307141028.GA31754@waldemar-brodkorb.de>
Message-ID: <20160420230508.7a2f5582@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Mar 2016 15:10:28 +0100, Waldemar Brodkorb wrote:
> This fixes bug 8766:
> https://bugs.busybox.net/show_bug.cgi?id=8766
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../4.8.5/930-libgcc-disable-split-stack-nothreads.patch |   14 ++++++++++++++
>  .../4.9.3/930-libgcc-disable-split-stack-nothreads.patch |   14 ++++++++++++++
>  .../5.3.0/930-libgcc-disable-split-stack-nothreads.patch |   14 ++++++++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 package/gcc/4.8.5/930-libgcc-disable-split-stack-nothreads.patch
>  create mode 100644 package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch
>  create mode 100644 package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch

I did apply this patch to master yesterday. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
