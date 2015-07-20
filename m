From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 20 Jul 2015 21:55:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-19
In-Reply-To: <20150720063017.2400B101C74@stock.ovh.net>
References: <20150720063017.2400B101C74@stock.ovh.net>
Message-ID: <1437422115.1945.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2015-07-20 at 08:30 +0200, Thomas Petazzoni wrote:
> Build statistics for 2015-07-19
> ===============================
> 
>         success : 230
>        failures : 125
>        timeouts : 6  
>           TOTAL : 361
> 
> Classification of failures by reason
> ====================================
> 
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuil
> d.buildroot.net/results/c537a76d17012821ed5a6f4170f759efd4d269b0/
>          arm |                 libtirpc-0.3.1 | NOK | 
> http://autobuild.buildroot.net/results/e3c5be7dca753f7494e8680894f516
> a8cdc89843/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuil
> d.buildroot.net/results/2bb2e314f23b5ba48bb6e0c4fc7e52032fa5d76b/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuil
> d.buildroot.net/results/394073e0d85b56e6e470ff7a4be3f0f9fb592150/

All musl build errors. I am already working on this.

>          arm |                 libtirpc-0.3.1 | NOK | 
> http://autobuild.buildroot.net/results/80321de8d4c6c0a00439b07289a581
> 8962128b43/

This is odd:
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
# libtirpc needs a toolchain w/ threads

-> why is libtirpc build anyhow?

>          arm |                 libtirpc-0.3.1 | NOK | 
> http://autobuild.buildroot.net/results/51115754531fbb78b0e5f5bb6accf0
> 500cc6bf63/
> 
