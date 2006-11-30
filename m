From: Pavel Roskin <proski@gnu.org>
Date: Wed, 29 Nov 2006 19:26:19 -0500
Subject: [Buildroot] [Fwd: Re: [Fwd: Re:  SDL_image,
	SDL_ttf & Co	(libpng12.So bug)]]
In-Reply-To: <456DBADE.6000001@elaxys.com.br>
References: <456DB752.1030402@elaxys.com.br> <456DBADE.6000001@elaxys.com.br>
Message-ID: <1164846379.23643.42.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2006-11-29 at 14:52 -0200, Claudio Leonel wrote:
> Hi,
> 
> I think so.
> To be sure, I recompiled again from scratch and it compiled OK.
> I have attached my current makefiles for SDL and SDL_image.

It would be much friendlier to others if you sent the patches instead.
The patches either preserve changes made by others or fail.  They don't
undo changes made by others.  Patches make the intent of the change
easier to understand.

Others can make a patch from the whole files if they know your base
version.  But they cannot know if the patch is changing accidentally
something that the author didn't intend to change.

-- 
Regards,
Pavel Roskin
