From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:22:07 +0200
Subject: [Buildroot] [PATCH] package/boost: stop on the first error
 during install to staging
In-Reply-To: <1431722177-4629-1-git-send-email-romain.naour@openwide.fr>
References: <1431722177-4629-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150516142207.5ad3f990@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 15 May 2015 22:36:17 +0200, Romain Naour wrote:
> -q option is missing in BOOST_INSTALL_STAGING_CMDS,
> so the build doesn't stop on the first error.
> This help to see what happened.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
