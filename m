From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Mar 2008 09:18:20 +0100
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <1206086506.2562.64.camel@nigel-x60> (Nigel Kukard's message of
	"Fri\, 21 Mar 2008 08\:01\:46 +0000")
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk>
	<1206086506.2562.64.camel@nigel-x60>
Message-ID: <873aqk32yb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 Nigel> The other problem is getting some patches to get fixed when a problem is
 Nigel> found ... not all of us are familiar with every single arch or even
 Nigel> assembly in some cases, let alone arch specific assembly.

 Nigel> I think a split would be a good idea, also maybe make it
 Nigel> easier to debug issues.

Or atleast only let the people using that particular arch worry about
it ;)


 >> - package-version-*.patch for generic stuff
 >> - arch-package-version-*.patch for arch specific stuff
 >> 
 >> What do you think?

 Nigel> What about patch order? and patch order when there is generic stuff and
 Nigel> arch specific?

My (possibly too simplistic) view on things is to first apply the
generic patches, and then the arch specific ones.

-- 
Bye, Peter Korsgaard
