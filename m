From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2020 08:48:31 +0100
Subject: [Buildroot] [PATCH ] package/sdl2: SDL2 2.0.09 to Version 2.0.10
In-Reply-To: <1270bd947c2e436e940d0a07f7f7e5a0@go-sys.de> (Michael Fischer's
 message of "Mon, 3 Feb 2020 14:48:22 +0000")
References: <1270bd947c2e436e940d0a07f7f7e5a0@go-sys.de>
Message-ID: <87v9o5d580.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

 > -SDL2_VERSION = 2.0.9
 > +SDL2_VERSION = 2.0.10

We are having a number of build issues since the version bump in the
autobuilders related to an X11/Xlib.h include. Care to have a look and
if possible send a fix?

http://autobuild.buildroot.net/?reason=sdl2-2.0.10

-- 
Bye, Peter Korsgaard
