From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 11:11:03 +0100
Subject: [Buildroot] [PATCH 4/5] rpi: rename board folder for consistency
In-Reply-To: <5db8e0c38bc04628a5286eb3c90ab0c0ee543b53.1383693880.git.yann.morin.1998@free.fr>
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <5db8e0c38bc04628a5286eb3c90ab0c0ee543b53.1383693880.git.yann.morin.1998@free.fr>
Message-ID: <20131106111103.1a1f1d13@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  6 Nov 2013 00:28:19 +0100, Yann E. MORIN wrote:
> From: mathieu benoit <mathieu.benoit@savoirfairelinux.com>
> 
> All the Raspberry Pi files (packages and config) are prefix with
> "rpi", so rename the board directory to "rpi" for consistency.
> 
> Signed-off-by: Mathieu Benoit <mathieu.benoit@savoirfairelinux.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  board/{raspberrypi => rpi}/readme.txt | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename board/{raspberrypi => rpi}/readme.txt (100%)

I'm not sure I agree with this one. I find "rasberrypi" a lot more
obvious for the new comer. Maybe our defconfig should also be called
rasberrypi_defconfig.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
