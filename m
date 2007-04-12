From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Thu, 12 Apr 2007 17:08:18 +0200
Subject: [Buildroot] frame buffer problems
In-Reply-To: <2831.63.193.249.101.1176390028.squirrel@webmail.aerende.com>
	(nina holly's message of "Thu, 12 Apr 2007 08:00:28 -0700 (PDT)")
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
	<43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>
	<2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>
	<87tzvoogsd.fsf@sleipner.barco.com>
	<2831.63.193.249.101.1176390028.squirrel@webmail.aerende.com>
Message-ID: <876481fx5p.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nina" == nina holly <nina.holly@aerende.com> writes:

>> What is the return value of open?

nina> Return value of open = -1

And errno is?

nina> I have another frame buffer program that draws a checkerboard on
nina> the screen.  On the same buildroot version and board the return
nina> values from open and the ioctls are not less than zero, but the
nina> program crashes with a segmentation fault when pixels are
nina> written to the screen buffer.

Odd. Exact same binaries, or recompiled with the new uclibc?

-- 
Bye, Peter Korsgaard
