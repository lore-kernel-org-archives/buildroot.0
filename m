From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jul 2010 19:57:52 +0200
Subject: [Buildroot] SDL error
In-Reply-To: <AANLkTimPniOL9FCAY6DiekWBjZB07cpxeCB_ztd9ff1C@mail.gmail.com>
	(Mahmoud Mamdouh's message of "Sat, 3 Jul 2010 19:56:30 +0300")
References: <AANLkTimPniOL9FCAY6DiekWBjZB07cpxeCB_ztd9ff1C@mail.gmail.com>
Message-ID: <87zky88n33.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mahmoud" == Mahmoud Mamdouh <mamdouh.al.shamy@gmail.com> writes:

 Mahmoud> while making FS with Buildroot (BusyBox)
 Mahmoud> i included SDL
 Mahmoud> but i dot that error

 Mahmoud> "
 Mahmoud> checking for sdl-config... (cached) no
 Mahmoud> checking for SDL - version >= 1.2.0... no
 Mahmoud> *** The sdl-config script installed by SDL could not be found
 Mahmoud> *** If SDL was installed in PREFIX, make sure PREFIX/bin is in
 Mahmoud> *** your path, or set the SDL_CONFIG environment variable to the
 Mahmoud> *** full path to sdl-config.
 Mahmoud> configure: error: *** SDL version 1.2.0 not found!
 Mahmoud> make: *** [/media/HomeLand/GP/FS/FS_3Jul_SDL_ogg/build/sdl_sound-1.0.3
 Mahmoud> /.stamp_configured] Error 1
 Mahmoud> "

There wasn't a make dependency on sdl to ensure it got built before
sdl_sound - Fixed in git (fc5cc936d).

Thanks.

-- 
Bye, Peter Korsgaard
