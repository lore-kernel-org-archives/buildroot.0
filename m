From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:49:08 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] domoticz: do not use static version of openssl
In-Reply-To: <20180830163826.5397-1-fontaine.fabrice@gmail.com>
References: <20180830163826.5397-1-fontaine.fabrice@gmail.com>
Message-ID: <20180901144908.6a560c4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 18:38:26 +0200, Fabrice Fontaine wrote:
> Due to the dependency on mosquitto, domoticz depends on !BR2_STATIC_LIBS
> so set USE_OPENSSL_STATIC to OFF (default value is ON)
> 
> This parameter has been added in release 4.9700.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update commit message: build failure was reproduced and this patch is
>    correctly fixing it

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
