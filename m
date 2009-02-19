From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 13:14:56 +0100
Subject: [Buildroot] RFC: option to Makefile.autotools.in to build in
	$(PROJECT_BUILD_DIR)
In-Reply-To: <20090219113320.GB1829@mx.loc> (Bernhard Reutner-Fischer's
	message of "Thu\, 19 Feb 2009 12\:33\:20 +0100")
References: <20090217050218.GA20875@cloud.net.au>
	<87wsbmad7g.fsf@macbook.be.48ers.dk> <20090219113320.GB1829@mx.loc>
Message-ID: <87fxiaaain.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> I admit that i didn't look but it sounds a bit like you
 Bernhard> would want to do the same like i did for THIS_SRCDIR
 Bernhard> (THIS_BUILDDIR comes to mind).  HTH,

The target-specific-variable make feature is indeed usefull, but I
don't quite see how to apply it in this case.

-- 
Bye, Peter Korsgaard
