From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:37:37 +0200
Subject: [Buildroot] [PATCH v2] package/openvpn: add pkcs11 support
In-Reply-To: <20191030005604.81615-3-aduskett@gmail.com>
References: <20191030005604.81615-1-aduskett@gmail.com>
 <20191030005604.81615-3-aduskett@gmail.com>
Message-ID: <20200412233737.3b2a6521@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Oct 2019 17:56:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If the pkcs11-helper package is selected, add the package to the
> dependency list and explicitly set --enable-pkcs11.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openvpn/openvpn.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
