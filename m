From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 18:15:36 +0200
Subject: [Buildroot] [PATCH] gawk: install /usr/bin/awk as a relative
 symlink
In-Reply-To: <20180725111810.19587-1-casantos@datacom.com.br>
References: <20180725111810.19587-1-casantos@datacom.com.br>
Message-ID: <20180725181536.79b98056@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jul 2018 08:18:10 -0300, Carlos Santos wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/bf3937882023df7ed319dc76f1af10f79785112f/
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/gawk/gawk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
