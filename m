From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:59:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/i2pd: bump to version
 2.33.0
In-Reply-To: <20200829182552.2695717-1-fontaine.fabrice@gmail.com>
References: <20200829182552.2695717-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829215900.28931245@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 20:25:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> From https://github.com/PurpleI2P/i2pd/releases/tag/2.33.0:
>  - UDP tunnels through ECIES-X25519-AEAD-Ratchet
>  - Shared transient addresses
>  - ECIES-X25519-AEAD-Ratchet and multiple encryption keys through I2CP
>  - Pre-calculated x25519 ephemeral keys
>  - crypto.ratchet.inboundTags parameter
>  - Don't save invalid address to AddressBook
>  - Correct ECDSA signatures names in SAM
>  - New webconsole layout
>  - Shared routing path for datagram session
>  - Change datagram routing path if nothing comes back in 10 seconds
>  - Updated reseed servers list
>  - Don't connect through terminated SAM destination
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/i2pd/i2pd.hash | 3 ++-
>  package/i2pd/i2pd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
