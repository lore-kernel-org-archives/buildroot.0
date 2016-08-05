From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 15:49:16 +0200
Subject: [Buildroot] [PATCH] libsepol: fix static build
In-Reply-To: <0df01bb703825aef5dc941f57729e5061b593941.1470390276.git.baruch@tkos.co.il>
References: <0df01bb703825aef5dc941f57729e5061b593941.1470390276.git.baruch@tkos.co.il>
Message-ID: <20160805154916.6aebccdd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 12:44:36 +0300, Baruch Siach wrote:
> Commit a3ebe45dcb3e (libsepol: bump to version 2.5, 2016-06-26) didn't refresh
> correctly the patch adding static build support. Do this now.
> 
> Fixes:
> http://autobuild.buildroot.net/results/14b/14bbb7c9c59e7f68f3ae7ad63e075e27a0da2b1e/
> http://autobuild.buildroot.net/results/97f/97f61d5e46a7f479e8de5dd19d49f7a3d84cc86e/
> http://autobuild.buildroot.net/results/920/920e1ddac6bf93707a187e64a4ef7d95aff09e6c/
> 
> Cc: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libsepol/0001-support-static-only.patch | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
