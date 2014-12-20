From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:47:17 +0100
Subject: [Buildroot] [PATCH] package/weston: do not select rpi-userland
In-Reply-To: <1419099761-32669-1-git-send-email-yann.morin.1998@free.fr>
References: <1419099761-32669-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141220214717.1b32951d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 20 Dec 2014 19:22:41 +0100, Yann E. MORIN wrote:
> rpi-userland is a provider for some virtual packages, so we can not
> select it, as instructed in the manual:
> 
>     http://nightly.buildroot.org/#_infrastructure_for_virtual_packages
> 
>     ---8<---
>     If your package really requires a specific provider, then you?ll
>     have to make your package depends on this provider; you can not select a
>     provider.
>     ---8<---
> 
> Instead, just depend on it. Remove the comment as well.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
