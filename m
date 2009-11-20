From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Nov 2009 16:55:18 +0100
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091120152853.GV919@mx.loc> (Bernhard Reutner-Fischer's message
	of "Fri\, 20 Nov 2009 16\:28\:53 +0100")
References: <20091007162422.GI10261@mx.loc> <20091009095152.555ceed2@surf>
	<20091009100008.7d0f2c65@surf> <20091009094809.GH2266@mx.loc>
	<87my40hkmz.fsf@macbook.be.48ers.dk>
	<87vdh5gxeh.fsf@macbook.be.48ers.dk> <20091120152853.GV919@mx.loc>
Message-ID: <87my2hgpi1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Fri, Nov 20, 2009 at 02:04:38PM +0100, Peter Korsgaard wrote:
 >>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> So in other words, we should just have clean and distclean, where the
 Peter> only difference between those two is that clean doesn't delete your
 Peter> .config?
 >> 
 >> No objections? Ok, I'll implement it like that then.

 Bernhard> I'd keep conf,mconf and related .o on clean

Me too, clean now only deletes everything in output/.

-- 
Bye, Peter Korsgaard
