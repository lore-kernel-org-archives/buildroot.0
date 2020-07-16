From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:20:22 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: remove
 sdl2-config.cmake
In-Reply-To: <20200505184303.609201-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 5 May 2020 20:43:02 +0200")
References: <20200505184303.609201-1-romain.naour@gmail.com>
Message-ID: <875zantos9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > We are using autotools build system for sdl2, so the sdl2-config.cmake
 > include path are not resolved like for sdl2-config script [1].
 > Remove sdl2-config.cmake file and avoid unsafe include path if this
 > file is used by a cmake based package.

 > This trigger an issue with ogre 1.12.6 package that replaced
 > FindSDL2.cmake by sdl2-config.cmake [2].

 > Thanks to Pavel Rojtberg for the help [3].

 > [1] https://bugzilla.libsdl.org/show_bug.cgi?id=4597
 > [2] https://github.com/OGRECave/ogre/commit/6de6f9b4081a07c911932441700c54b72ec1ee1f
 > [3] https://github.com/OGRECave/ogre/issues/1568

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
