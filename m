From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 25 Jun 2007 15:44:04 +0300
Subject: [Buildroot] PATCH: fix SDL-1.2.11 PAGE_SIZE missing definition
In-Reply-To: <20070625111229.GH5134@aon.at>
References: <20070625134241.07169998@newbox>
	<20070625111229.GH5134@aon.at>
Message-ID: <20070625154404.3c691558@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jun 2007 13:12:29 +0200
Bernhard Fischer wrote:

> On Mon, Jun 25, 2007 at 01:42:41PM +0300, Ivan Kuten wrote:
> >Hello,
> >
> >When SDL configured to use fbcon, the build is failed because PAGE_SIZE is undeclared in <asm/page.h> 
> >referred from src/video/fbcon/SDL_fbvideo.c
> >
> >Instead we are using libc functions to know PAGE_SIZE and only as last resort make it hardcoded to 4096.
> >The patch below fixes the problem.
> >
> >Best regards,
> 
> Please send this to the SDL guys too.
> Applied, thanks!

They have it fixed in SVN SDL 1.3.x branch - but it's not released as stable version.

Best regards,
Ivan
