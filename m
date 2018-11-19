From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:24:46 +0100
Subject: [Buildroot] [PATCH] vtun: remove reference to start-stop-daemon
 from package help
In-Reply-To: <20181116031647.29084-1-casantos@datacom.com.br>
References: <20181116031647.29084-1-casantos@datacom.com.br>
Message-ID: <20181119222446.209c96e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 01:16:47 -0200, Carlos Santos wrote:
> None of the other 82 packages that use start-stop-daemon does this.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/vtun/Config.in | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
