From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:55:07 +0100
Subject: [Buildroot] [PATCH] configs/nanopi-neo: use a more conventional
 kernel
In-Reply-To: <1478279980-20767-1-git-send-email-yann.morin.1998@free.fr>
References: <1478279980-20767-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161105115507.7902c652@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Nov 2016 18:19:40 +0100, Yann E. MORIN wrote:
> It turns out that linux-4.9-rc3 has all that is needed for the NanoPi
> NEO, so use that rather than the franken-kernel I assembled.
> 
> Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  configs/nanopi_neo_defconfig | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
