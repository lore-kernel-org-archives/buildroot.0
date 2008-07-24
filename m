From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Jul 2008 16:35:17 +0200
Subject: [Buildroot] [PATCH 2/5] SDL_net: add new package SDL_net
In-Reply-To: <1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <20080724143517.GB4991@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 24, 2008 at 03:21:54PM +0200, Hans-Christian Egtvedt wrote:
>This patch adds a new package SDL_net. SDL_net is a small, low-level,
>cross-platform network library, that can be used with the Simple DirectMedia
>Layer library (SDL).
>

>+	  http://www.libsdl.org/projects/SDL_net/
>diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
>new file mode 100644
>index 0000000..a0108f3
>--- /dev/null

please use Makefile.autotools.in
