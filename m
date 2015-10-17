From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:32:50 +0200
Subject: [Buildroot] [PATCH] ccache: allow for BR2_CCACHE_DIR
 environment override
In-Reply-To: <1444915479-7871-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1444915479-7871-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151017163250.1394258c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Thu, 15 Oct 2015 10:24:39 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Allow the BR2_CCACHE_DIR .config option to be overriden by the
> BR2_CCACHE_DIR env variable.
> This is useful for big projects where in some cases the developers home
> directory might be a NFS mount (slow) and real production builds aren't.
> 
> Update documentation accordingly as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  Makefile                     | 6 ++++--
>  docs/manual/common-usage.txt | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
