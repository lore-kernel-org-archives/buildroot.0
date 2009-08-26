From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Aug 2009 09:43:05 +0200
Subject: [Buildroot] how to build code checked out from a version
	control system
In-Reply-To: <1251195956.10767.16.camel@sven> (Sven Neumann's message of "Tue\,
	25 Aug 2009 12\:25\:56 +0200")
References: <1251195956.10767.16.camel@sven>
Message-ID: <87ocq3m35i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> we have some code there that lives in a Bazaar repository and that we
 Sven> would like to build from within our buildroot setup. I have created
 Sven> buildroot packages for these modules, but somehow I ended up with lots
 Sven> of hacks and things are still not working properly. I wonder if there is
 Sven> some example or documentation that I should have a look at. Is anyone
 Sven> doing something similar and could show me how to do this properly?

What exactly goes wrong? It's normally just a matter of providing a
custom source step doing the checkout.

See the tremor handling in package/multimedia/libvorbis/libvorbis.mk
for an example. You could argue about the usefullness of creating a
dated tarball of the checkout or not.

-- 
Bye, Peter Korsgaard
