From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:19:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/sdl_mixer: drop unrecognized
 option
In-Reply-To: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
References: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
Message-ID: <20210422211911.08caaae1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Apr 2021 12:05:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --without-x is not recognized since at least version 1.2.12:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --without-x
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdl_mixer/sdl_mixer.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
