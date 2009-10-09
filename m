From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 15:40:30 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <20091009123931.GP2266@mx.loc> (Bernhard Reutner-Fischer's
	message of "Fri\, 9 Oct 2009 14\:39\:31 +0200")
References: <2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
	<87vdiohl1r.fsf@macbook.be.48ers.dk> <20091009112619.GL2266@mx.loc>
	<87iqeohkam.fsf@macbook.be.48ers.dk> <20091009115425.GN2266@mx.loc>
	<878wfkhitf.fsf@macbook.be.48ers.dk> <20091009123931.GP2266@mx.loc>
Message-ID: <87d44weldd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> OK, that one I can reproduce. So the fix only really fixes a problem
 >> with linux26, as uclibc has mkdir -p $(TOOLCHAIN_DIR) in it's .unpacked
 >> rule and busybox depends on BUILD_DIR.

 Bernhard> I retract my proposed patch.

I already committed and pushed your patch. Care to cook a new one that I
can apply on top instead?

-- 
Bye, Peter Korsgaard
