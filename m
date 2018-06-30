From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:32:26 +0200
Subject: [Buildroot] [PATCH v3] dropbear: enable PAM authentication if
 linux-pam is selected
In-Reply-To: <20180629122109.7356-1-casantos@datacom.com.br>
References: <20180629115039.52bpwyk7xenbly53@tarshish>
 <20180629122109.7356-1-casantos@datacom.com.br>
Message-ID: <20180630183226.6f39e0e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 09:21:09 -0300, Carlos Santos wrote:
> - Disable password file authentication, since it's not possible to have
>   both at once.
> - Install a /etc/pam.d/sshd file, based on the one installed by openssh.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>
> ---
> Changes v1->v2:
> - Fix commit message.
> Changes v2->v3:
> - athentication -> authentication (gah!)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
