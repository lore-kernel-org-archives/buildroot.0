From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 11:14:10 +0200
Subject: [Buildroot] [Patch v2 1/3] jemalloc: new package
In-Reply-To: <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160705111410.6df62de8@free-electrons.com>
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

I've applied, after making the fixes suggested by Romain Naour:

    [Thomas:
     - remove trailing slash (noticed by Romain Naour)
     - add !BR2_STATIC_LIBS dependency (noticed by Romain Naour).]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
