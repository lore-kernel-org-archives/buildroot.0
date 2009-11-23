From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Nov 2009 23:02:14 +0100
Subject: [Buildroot] [PATCH] SDL_image: fix runtime libjpeg failure
In-Reply-To: <20091123060922.GA6897@jasper.tkos.co.il> (Baruch Siach's message
	of "Mon\, 23 Nov 2009 08\:09\:22 +0200")
References: <20091109130709.GF26599@jasper.tkos.co.il>
	<20091123060922.GA6897@jasper.tkos.co.il>
Message-ID: <873a44ew7t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Hi Buildroot list,
 Baruch> Ping?

Hi, sorry for the slow response.

 Baruch> Should I open a Bugzilla entry to have this issue handled?
 Baruch> Is there a better solutions?

No, it's an OK solution, but it isn't complete as the configure script
will do the same for png and tiff, so you need --disable-*-shared for
those as well.

I'll fix that and commit, thanks.

-- 
Bye, Peter Korsgaard
