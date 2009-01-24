From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 12:46:05 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/mpg123
In-Reply-To: <1232794656.5311.130.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sat\, 24 Jan 2009 11\:57\:36 +0100")
References: <20090124101510.62459769CC@busybox.osuosl.org>
	<87r62tgfme.fsf@macbook.be.48ers.dk>
	<1232794656.5311.130.camel@elrond.atmel.com>
Message-ID: <87eiytgc5e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> It fixes a similar problem, but apparently not my problem.
 Ulf> Why revert? 
 Ulf> do we want really want to run into the problem which it fixes?

Well, it depends. Where is it from? What problem exactly does it fix?
What is the risk that it breaks something else?

E.G. if it's in the tree for 4.3.3, then that's fine, otherwise we
might want to consider what to do ..

Please mention where patches are from if you didn't create them
yourself in the commit message, thanks.

-- 
Bye, Peter Korsgaard
