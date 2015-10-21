From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:28:55 +0200
Subject: [Buildroot] [PATCH v5 1/1] sdl2: new package
In-Reply-To: <1437245698-24942-1-git-send-email-romain.naour@openwide.fr>
References: <1437245698-24942-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151021232855.3ad5aaca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 18 Jul 2015 20:54:58 +0200, Romain Naour wrote:
> From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> [Romain:
>   - Wrap Config.in help text at 72 columns.
>   - Move sdl2 package after sdl modules in Config.in. (Arnout)
>   - Explicitly disable dbus and wayland.
>   - Remove double underscore (SDL2__*).
>   - Unify autotools options to use --enable/--disable.
>   - Use x-includes and x-libraries to avoid path poisoning.
>   - Remove xlib_libXrender, xproto_inputproto and xproto_scrnsaverproto
>     dependencies since the build system doesn't depend on them.
>   - Add Xlib_libXi, xlib_libScrnSaver and xlib_libXxf86vm dependencies.
>   - Handle autotools options (--enable/--disable) for each X11
>     dependencies.]
> 
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Yann E. Morin <yann.morin.1998@free.fr>
> ---

Applied with a few additional tweaks:

    [Thomas:
      - Minor tweaks to Config.in
      - Addition of hash file.
      - Addition of SDL2_CONFIG_SCRIPTS, as suggested by Vincent Stehl?.]

Thanks all for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
