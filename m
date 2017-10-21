From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:13:16 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: fix help comment for gcc
 optimization
In-Reply-To: <1508498357-4257-1-git-send-email-lothar.felten@gmail.com>
References: <1508498357-4257-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20171021101316.34da07a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Oct 2017 13:19:17 +0200, Lothar Felten wrote:
> The default for is set to BR2_OPTIMIZE_S, the help comment designated
> BR2_OPTIMIZE_0 as default.
> Changed the help comment to show that BR2_OPTIMIZE_S is the default.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Impressive that this has been wrong for so long without being noticed.
Applied your patch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
