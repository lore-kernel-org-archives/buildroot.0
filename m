From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:44:39 +0200
Subject: [Buildroot] [PATCH v3] dropbear: Disable legacy/insecure options
In-Reply-To: <20180703074810.19105-1-stefan.sorensen@spectralink.com>
References: <20180703074810.19105-1-stefan.sorensen@spectralink.com>
Message-ID: <20180704214439.27e4d113@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jul 2018 09:48:10 +0200, Stefan S?rensen wrote:
> Dropbear by default enables a number of algorithms that are now considered
> insecure and should only be used when legacy support is required:
>    3DES encryption
>    Blowfish encryption
>    SHA1-96 message integrity
>    CBC encryption mode
>    DSA public keys
>    Diffie-Hellman Group1 key exchange
> 
> So disable them by default, but add a config option for bringing them back.
> Furthermore the Blowfish legacy algorithm is unconditionally disabled
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
> Changes v2->v3:
>  * Rebase on 037b8616257067282e375edca9af19418a0e7a4a

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
