From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 10:40:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl_ttf: Update to de50cffd41e6
In-Reply-To: <20201210181806.8685-1-glex.spb@gmail.com>
References: <20201210181806.8685-1-glex.spb@gmail.com>
Message-ID: <20210102104052.218ad278@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Dec 2020 18:18:06 +0000
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> There is unlikely to be a new SDL_ttf release for the foreseeable future:
> https://bugzilla.libsdl.org/show_bug.cgi?id=5344#c1
> 
> The unreleased version from HEAD as of 2020-11-09 has several bugfixes
> and DPI scaling support:
> https://hg.libsdl.org/SDL_ttf/rev/7dbd7cd826d6
> 
> DPI scaling is used for rendering on HiDPI displays and displays
> with non-square pixels.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/sdl_ttf/sdl_ttf.hash |  2 +-
>  package/sdl_ttf/sdl_ttf.mk   | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
