From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Jun 2013 08:44:03 +0200
Subject: [Buildroot] [PATCH 1/7] sdl: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 3 Jun 2013 22:03:29 -0400")
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <871u8igyto.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Danomi> ---
 Danomi>  package/sdl/sdl.mk |    2 ++
 Danomi>  1 file changed, 2 insertions(+)

 Danomi> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
 Danomi> index 59576fb..85d8cd1 100644
 Danomi> --- a/package/sdl/sdl.mk
 Danomi> +++ b/package/sdl/sdl.mk
 Danomi> @@ -7,6 +7,8 @@
 Danomi>  SDL_VERSION = 1.2.15
 Danomi>  SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 Danomi>  SDL_SITE = http://www.libsdl.org/release
 Danomi> +SDL_LICENSE = LGPLv2.1

It's the 'or (at your option) any later version', so it is LGPLv2.1+.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
