From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:11:59 +0100
Subject: [Buildroot] [PATCH] libtasn1: security bump to version 4.13
In-Reply-To: <a055dd8302369efd8f63a769d9a6f2965b2a98da.1518115605.git.baruch@tkos.co.il>
References: <a055dd8302369efd8f63a769d9a6f2965b2a98da.1518115605.git.baruch@tkos.co.il>
Message-ID: <20180208221159.25192fc9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Feb 2018 20:46:45 +0200, Baruch Siach wrote:
> CVE-2017-10790: NULL pointer dereference and crash when reading crafted
> input
> 
> CVE-2018-6003: Stack exhaustion due to indefinite recursion during BER
> decoding
> 
> Add license files hashes.
> 
> Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libtasn1/libtasn1.hash | 6 +++++-
>  package/libtasn1/libtasn1.mk   | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
