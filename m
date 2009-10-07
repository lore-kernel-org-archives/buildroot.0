From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 20:27:50 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091007162422.GI10261@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 7 Oct 2009 18\:24\:22 +0200")
References: <20091007162422.GI10261@mx.loc>
Message-ID: <87k4z7kqjd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> Hi,
 Bernhard> Currently the clean target (as well as dirclean) does nothing useful.

 Bernhard> I propose the following change:

 Bernhard> # wipe target
 Bernhard> clean:
 Bernhard> # remove generated files, retain configs
 Bernhard> realclean:
 Bernhard> # remove generated files, including configs (but not DL_DIR!)

We btw need to update the 'make help' output to match.

-- 
Bye, Peter Korsgaard
