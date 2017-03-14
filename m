From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:42:06 +0100
Subject: [Buildroot] [PATCH] kmscube: Remove the manually creation of m4
 directory
In-Reply-To: <1489429465-19719-1-git-send-email-festevam@gmail.com>
References: <1489429465-19719-1-git-send-email-festevam@gmail.com>
Message-ID: <20170314234206.00c65fea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 15:24:25 -0300, Fabio Estevam wrote:
> Since kmscube upstream commit a2dc60cf05b704 ("Add m4/.gitignore")
> there is no need to manually create the m4 directory anymore, so
> simply remove KMSCUBE_POST_PATCH_HOOKS.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/kmscube/kmscube.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
