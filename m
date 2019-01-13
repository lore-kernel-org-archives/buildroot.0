From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 22:55:22 +0100
Subject: [Buildroot] [PATCH 1/7] fdk-aac: enable for aarch64
In-Reply-To: <1547383071-11783-2-git-send-email-gilles.talis@gmail.com>
References: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
 <1547383071-11783-2-git-send-email-gilles.talis@gmail.com>
Message-ID: <20190113225522.559ada0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 13:37:45 +0100, Gilles Talis wrote:
> Support for this architecture was added in commit:
> 1d686c3a23f3ae286ef964ab62199be96e4ad1dc
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/fdk-aac/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, but I've reformatted how the option is described to
make it a bit nicer (by using several "default y if ..." lines).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
