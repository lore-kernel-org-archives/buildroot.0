From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:58:53 +0200
Subject: [Buildroot] [PATCH] skeleton: drop PAGER
In-Reply-To: <20190906092509.2610241-1-lkundrak@v3.sk>
References: <20190906092509.2610241-1-lkundrak@v3.sk>
Message-ID: <20190907215853.206dfc48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 11:25:09 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> There doesn't seem to be possible to track down the reason why the  profile
> sets $PAGER other than that it has always been there.
> 
> However, it defeats pager autodetection by various tool (systemctl, nmcli,
> etc.) that would otherwise prefer less to more, in case both were available.
> 
> Let's drop it. My desktop Linux distro (Fedora) doesn't seem to set it
> either and the universe doesn't seem to have collapsed yet.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  system/skeleton/etc/profile | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
