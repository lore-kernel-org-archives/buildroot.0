From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:24:43 +0100
Subject: [Buildroot] [PATCH] package/supertux: bump to version 0.6.0
In-Reply-To: <20181224113401.13309-1-romain.naour@gmail.com>
References: <20181224113401.13309-1-romain.naour@gmail.com>
Message-ID: <20181226212443.18489d9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Dec 2018 12:34:01 +0100, Romain Naour wrote:
> * Bump the minimum version of gcc since supertux require the C++14
>   standard.
> * Add boost locale dependency since it's now checked by the build
>   system.
> * Add libpng dependency for savepng feature.
> * Add freetype dependency for the support for right-to-left languages.
> * Disable ENABLE_OPENGLES2 for now, it can be enabled by a follow up
>   patch.
> * We don't add SDL_ttf dependency since it's included in the supertux
>   source code.
> * There is curently no libraqm package in Buildroot.
> * Remove the two sed command from SUPERTUX_FIX_ALTIVEC_ISSUE since the
>   CMake code has changed. Keep the one for tinygettext.
> 
> See:
> https://www.supertux.org/news/2018/12/23/0.6.0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/supertux/Config.in     |  9 ++++++---
>  package/supertux/supertux.hash |  2 +-
>  package/supertux/supertux.mk   | 12 ++++++------
>  3 files changed, 13 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
