From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 23:52:27 +0200
Subject: [Buildroot] [PATCH] package/sdl: disable x11 in host-sdl
In-Reply-To: <1397850429-5560-1-git-send-email-yann.morin.1998@free.fr>
References: <1397850429-5560-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140418235227.3a4dc5c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 18 Apr 2014 21:47:09 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> We do not need an X11-capable host SDL, so jsut disable X11 support.
> 
> This currently works if the build machine has the X11 development
> packages installed.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sdl/sdl.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
