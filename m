From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:14:43 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/sdl2: enable opengl support
In-Reply-To: <20170226164855.10834-1-romain.naour@gmail.com>
References: <20170226164855.10834-1-romain.naour@gmail.com>
Message-ID: <20170226211443.008666a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 17:48:53 +0100, Romain Naour wrote:
> OpenGl support mean GLX so it require X11 support.
> Select automatically BR2_PACKAGE_SDL2_X11 to enable minimal X11
> libraries support (libx11 and libxext).
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3: select BR2_PACKAGE_SDL2_X11 (ThomasP)
> ---
>  package/sdl2/Config.in | 11 +++++++++++
>  package/sdl2/sdl2.mk   |  8 +++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)

All three applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
