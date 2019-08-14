From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 14 Aug 2019 08:02:19 +0200
Subject: [Buildroot] [PATCH] packages/devmem2: remove from all board
 configurations
In-Reply-To: <877e7hmtbc.fsf@dell.be.48ers.dk>
References: <20190812181207.25287-1-unixmania@gmail.com>
 <20190813051258.xtkrbs3elkw33mft@M43218.corp.atmel.com>
 <877e7hmtbc.fsf@dell.be.48ers.dk>
Message-ID: <20190814060219.plj574qunybkm6gf@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2019 at 09:13:27AM +0200, Peter Korsgaard wrote:
> 
> >>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:
> 
>  > Hi Carlos,
>  > On Mon, Aug 12, 2019 at 03:12:07PM -0300, unixmania at gmail.com wrote:
>  >> 
>  >> From: Carlos Santos <unixmania@gmail.com>
>  >> 
>  >> It is not used by any other application selected by those defconfigs.
>  >> 
> 
>  > It's only here for debug purpose. Is the Busybox devmem version now
>  > enabled by default in order to have something in replacement?
> 
> Yes it is:
> 
> grep DEVMEM package/busybox/busybox.config
> CONFIG_DEVMEM=y

Ok, great.

Thx

Ludovic

> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
