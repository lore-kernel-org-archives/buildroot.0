From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 22:01:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-25
In-Reply-To: <20140226215740.4fd07066@skate> (Thomas Petazzoni's message of
 "Wed, 26 Feb 2014 21:57:40 +0100")
References: <20140226073009.06EDD100CEF@stock.ovh.net>
 <87k3cigt81.fsf@dell.be.48ers.dk> <20140226215740.4fd07066@skate>
Message-ID: <87fvn5d1wb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Thomas, I think you looked into it and it was something about it picking
 >> up lzma from the build machine. Do you have a fix?

 > Yeah, probably need to explicitly disable lzma support from
 > host-libxml2, I'd say.

Ok, will you send a patch or should I look into it? It seems we don't do
anything for lzma on the target either.


 >> >    powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/88d76be91d04a22dd2f1683396a172be085e1657/
 >> 
 >> Internal compiler error. Thomas, how old is this ctng toolchain?

 > Fairly old. Yann has provided me some newer ctng toolchains, but he has
 > used "br" as the vendor part of the tuple, which I find highly
 > confusing, so I haven't put in "production" these newer ctng toolchains.

Ok.


 >> >    powerpc |              xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/f62f8e63082fdfb9a68c8b4e629e5a7fa02b3bba/
 >> 
 >> Out of memory?
 >> 
 >> configure: creating ./config.status
 >> ./config.status: fork: Cannot allocate memory

 > Crappy build machine :-)

Yeah, I demand all my money back! ;)

-- 
Bye, Peter Korsgaard
