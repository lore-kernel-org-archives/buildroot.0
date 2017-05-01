From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 10:53:55 +0200
Subject: [Buildroot] [PATCH] package/kodi: re-install prompt for optical
 drives
In-Reply-To: <20170417140641.24527-1-yann.morin.1998@free.fr>
References: <20170417140641.24527-1-yann.morin.1998@free.fr>
Message-ID: <20170501105355.3d3df2d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 16:06:41 +0200, Yann E. MORIN wrote:
> In 81c438aa (package/kodi: Rework audio encoder support), the prompt for
> the optical drive support was dropped, on the assumption that such
> support was only needed when an audio encoder was enabled.
> 
> However, support for optical drives is also required when, surprisingly,
> one wants to read a DVD (and probably a BD as well, but this was not
> tested by lack of hardware).
> 
> Re-instate the prompt, so one can enable optical drive support even when
> no audio encoder enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/kodi/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
