From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Nov 2013 21:40:57 +0100
Subject: [Buildroot] [git commit] Update for 2013.11-rc1
In-Reply-To: <5283BB51.5060101@mind.be> (Arnout Vandecappelle's message of
 "Wed, 13 Nov 2013 18:48:01 +0100")
References: <20131112231429.89E849BBB5@busybox.osuosl.org>
 <5283BB51.5060101@mind.be>
Message-ID: <87wqkc11d2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> -<a href="/downloads/buildroot-2013.08-rc3.tar.gz">buildroot-2013.08-rc3.tar.gz</a>
 >> +<a href="/downloads/buildroot-2013.11-rc1tar.gz">buildroot-2013.11-rc1.tar.gz</a>

 >  Missing .

Ups.

 >> or
 >> -<a href="/downloads/buildroot-2013.08-rc3.tar.bz2">buildroot-2013.08-rc3.tar.bz2</a>.
 >> +<a href="/downloads/buildroot-2013.11-rc3.tar.bz2">buildroot-2013.11-rc1.tar.bz2</a>.
 >> <p>

And it is not rc3 :/ I must have been tired yesterday.


 >> +    tree, see the <a
 >> +    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">CHANGES</a>

 >  I never noticed before, but why do you tag with _rc1 instead of -rc1
 > so it corresponds to the tarball?

It's purely historical. I've done it since the very first 2009.02_rc1
tag. I don't recall the details any more, but I think I did so to match
the convention from uClibc or busybox. The convention of those dates
back to when CVS was used, which had quite some restrictions on what
characters could be used in tags.

With that said, I don't have any problems with changing the underscores
(_) to hyphens (-) going forward.

-- 
Bye, Peter Korsgaard
