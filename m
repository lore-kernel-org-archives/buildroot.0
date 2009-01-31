From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 23:28:21 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <20090131102612.GA6794@mx.loc> (Bernhard Reutner-Fischer's
	message of "Sat\, 31 Jan 2009 11\:26\:12 +0100")
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk> <1233309685.6293.17.camel@sven>
	<1233310475.6293.20.camel@sven> <8763jxnldm.fsf@macbook.be.48ers.dk>
	<1233314708.6293.26.camel@sven> <87wscdm3rf.fsf@macbook.be.48ers.dk>
	<20090131102612.GA6794@mx.loc>
Message-ID: <87bptnjeka.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> Thanks, but I think the correct thing is to use aapcs-linux (E.G. so
 >> it also works with older toolchains), and patch gcc 4.3.2 to accept
 >> that (like Bernhard already did).

 Bernhard> I think this is/will be fixed in gcc-4.4.0 and 4.3.3

Ok, good.

 >> I've checked in that patch already and will fix up the stuff in
 >> Config.in.arch now.

 Bernhard> As already mentioned several times somewhere else, you
 Bernhard> should synch (these parts of) your tree against
 Bernhard> improvements that went into my tree. This poor guy wouldn't
 Bernhard> have been bitten by this issue, fwiw.

It's a question of time, you are more than welcome to help and send
patches to the list ;)

-- 
Bye, Peter Korsgaard
