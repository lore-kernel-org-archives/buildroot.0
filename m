From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 28 Aug 2009 10:17:17 +0200
Subject: [Buildroot] SDL_net target name
In-Reply-To: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
Message-ID: <4A97928D.6070702@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Makefile target name to build SDL_net is "SDL_net" whereas all other
SDL_xx extensions are "sdl_xx" (example: make sdl_image, make sdl_ttf,
etc...).
Moreover it seems that most other BR target are in lowercase.

Is there any reason why SDL_net target should be an uppercase/lowercase
mix ?
Can you correct that for the coming release ? (I will soon propose
patches that depend on sdl_xx and I don't want to add to some more
"SDL_net" if it's not correct )

Regards,
Julien
