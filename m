From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:34:00 +0200
Subject: [Buildroot] [PATCH] Revert "package/kodi: optimise for RPi2"
In-Reply-To: <1462693482-29650-1-git-send-email-yann.morin.1998@free.fr>
References: <1462693482-29650-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160508153400.4031ca6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 May 2016 09:44:42 +0200, Yann E. MORIN wrote:
> Optimised support for the RPi-2 was only inttroduced in Krypton, the
> next release of Kodi. Jarvis, the current release, does not have this
> support.
> 
> This reverts commit ef37472b20894c99cad758397f3cd6b90f933df1.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Beno?t Mauduit <bmauduit@beneth.fr>
> ---
>  package/kodi/kodi.mk | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
