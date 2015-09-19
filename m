From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:32:06 +0200
Subject: [Buildroot] [PATCH 1/2] cmake: bump to version 3.3.2
In-Reply-To: <1442666531-17795-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1442666531-17795-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150919153206.018a8ac6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Sat, 19 Sep 2015 09:42:11 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> xtensa patch is upstream so there's no need for it any longer.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  ...IML-Teach-ABI.h-about-Xtensa-architecture.patch | 30 ----------------------
>  package/cmake/Config.in                            |  7 +++--
>  package/cmake/cmake.hash                           |  4 +--
>  package/cmake/cmake.mk                             |  6 ++---
>  4 files changed, 10 insertions(+), 37 deletions(-)
>  delete mode 100644 package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
