From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:25:02 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: disable parallel build
In-Reply-To: <1394096013-18180-1-git-send-email-alvaro.gamez@hazent.com>
References: <20140305154228.76f34797@skate>
 <1394096013-18180-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20140306182502.2de1a80a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Thu,  6 Mar 2014 09:53:33 +0100, Alvaro G. M wrote:
> Although upstream tries to support parallel builds, there are several
> dependencies that, if fixed, would end up making the library build
> linearly, so in the end there would be no benefit to fix those.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/996/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alvaro G. M. <alvaro.gamez@hazent.com>
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/libxmlrpc/libxmlrpc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
