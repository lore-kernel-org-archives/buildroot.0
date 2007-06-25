From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 13:12:29 +0200
Subject: [Buildroot] PATCH: fix SDL-1.2.11 PAGE_SIZE missing definition
In-Reply-To: <20070625134241.07169998@newbox>
References: <20070625134241.07169998@newbox>
Message-ID: <20070625111229.GH5134@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 25, 2007 at 01:42:41PM +0300, Ivan Kuten wrote:
>Hello,
>
>When SDL configured to use fbcon, the build is failed because PAGE_SIZE is undeclared in <asm/page.h> 
>referred from src/video/fbcon/SDL_fbvideo.c
>
>Instead we are using libc functions to know PAGE_SIZE and only as last resort make it hardcoded to 4096.
>The patch below fixes the problem.
>
>Best regards,

Please send this to the SDL guys too.
Applied, thanks!
