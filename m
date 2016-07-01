From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 1 Jul 2016 16:44:42 -0300 (BRT)
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <7524b7ea-7075-0058-8167-3fbc0051f2da@talktalk.net>
References: <7524b7ea-7075-0058-8167-3fbc0051f2da@talktalk.net>
Message-ID: <1666337934.7640332.1467402282012.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Stephen Agate" <stephen.agate@talktalk.net>
> To: buildroot at busybox.net, casantos at datacom.ind.br
> Sent: Friday, July 1, 2016 12:57:36 PM
> Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot 2016.05

> Carlos,
> 
> You are probably missing "include/linux/compiler-gcc5.h".
> 
> This one may work for you:
> 
> https://github.com/altera-opensource/u-boot-socfpga/commit/d3c9a256d6445129d01d1ea779d2587523190427
> 
> S.

Unfortunately that patch does not solve the problem. Thanks, anyway.

Carlos Santos (Casantos)
DATACOM, P&D
