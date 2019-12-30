From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 23:33:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: move options
In-Reply-To: <3b8aa710fabea4b4c22d4bc2c0944bdc976c7d18.1577738159.git.yann.morin.1998@free.fr>
References: <cover.1577738159.git.yann.morin.1998@free.fr>
 <3b8aa710fabea4b4c22d4bc2c0944bdc976c7d18.1577738159.git.yann.morin.1998@free.fr>
Message-ID: <20191230233308.2737aaa6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Dec 2019 21:36:14 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since e3159cad71 (package/libopenssl: move target arch selection
> to Config.in), we have a Config.in that contains a few options to
> configure libopenssl (openSSL, the original).
> 
> As such, it makes sense to move the remaining options there too.
> 
> We also move the condition there, mimicking what is done for the
> external toolchains' options too.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
