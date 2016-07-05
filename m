From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 19:14:24 +0200
Subject: [Buildroot] [Patch v2 1/3] jemalloc: new package
In-Reply-To: <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160705191424.06fbdd6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 21:46:30 +0200, Eric Le Bihan wrote:
> This new package provides jemalloc, a malloc(3) implementation that
> emphasizes fragmentation avoidance and scalable concurrency support.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in              |  1 +
>  package/jemalloc/Config.in     |  7 +++++++
>  package/jemalloc/jemalloc.hash |  2 ++
>  package/jemalloc/jemalloc.mk   | 15 +++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/jemalloc/Config.in
>  create mode 100644 package/jemalloc/jemalloc.hash
>  create mode 100644 package/jemalloc/jemalloc.mk

This package fails to build on NIOS2:

   http://autobuild.buildroot.net/results/674/674b6022f9a403528a758c0785656d2bda79e0a9/build-end.log

Could you have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
