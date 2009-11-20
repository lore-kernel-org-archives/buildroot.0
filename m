From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Nov 2009 14:04:38 +0100
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <87my40hkmz.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Fri\, 09 Oct 2009 13\:28\:04 +0200")
References: <20091007162422.GI10261@mx.loc> <20091009095152.555ceed2@surf>
	<20091009100008.7d0f2c65@surf> <20091009094809.GH2266@mx.loc>
	<87my40hkmz.fsf@macbook.be.48ers.dk>
Message-ID: <87vdh5gxeh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
 Peter> Hi,

 >>> * On the clean target
 >>> 
 >>> I see that all the stamps are removed. So this will trigger
 >>> basically a reconfigure + rebuild of all packages. Is this what we
 >>> want ?

 Bernhard> yes, this is what i as a user would expect.
 Bernhard> Something broke, i have to rebuild stuff, so i
 Bernhard> make clean ; make

 Peter> So in other words, we should just have clean and distclean, where the
 Peter> only difference between those two is that clean doesn't delete your
 Peter> .config?

No objections? Ok, I'll implement it like that then.

-- 
Bye, Peter Korsgaard
