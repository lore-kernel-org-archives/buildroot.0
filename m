From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Aug 2009 15:32:21 +0200
Subject: [Buildroot] SDL_net target name
In-Reply-To: <4A97928D.6070702@free.fr> (Julien Boibessot's message of "Fri\,
	28 Aug 2009 10\:17\:17 +0200")
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<4A97928D.6070702@free.fr>
Message-ID: <87tyzsdpy2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hi,
 Julien> Makefile target name to build SDL_net is "SDL_net" whereas all other
 Julien> SDL_xx extensions are "sdl_xx" (example: make sdl_image, make sdl_ttf,
 Julien> etc...).
 Julien> Moreover it seems that most other BR target are in lowercase.

 Julien> Is there any reason why SDL_net target should be an uppercase/lowercase
 Julien> mix ?
 Julien> Can you correct that for the coming release ? (I will soon propose
 Julien> patches that depend on sdl_xx and I don't want to add to some more
 Julien> "SDL_net" if it's not correct )

Not really, fixed in git - Thanks.

-- 
Bye, Peter Korsgaard
