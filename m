From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 20:09:57 +0200
Subject: [Buildroot] Improper device nodes
	createdinsideproject_build_arm/uclibc/root/dev/
In-Reply-To: <016401c8a564$106164b0$020514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 23 Apr 2008 19\:03\:36 +0200")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<8763uaqs3b.fsf@macbook.be.48ers.dk>
	<20080422095909.GA31643@cloud.net.au>
	<040301c8a49d$c1408170$050514ac@atmel.com>
	<87tzhtoihz.fsf@macbook.be.48ers.dk>
	<044f01c8a4a9$cfed41c0$050514ac@atmel.com>
	<87hcdtobni.fsf@macbook.be.48ers.dk>
	<d6cda7730804221745r419a43dft863faddfd681aba7@mail.gmail.com>
	<016401c8a564$106164b0$020514ac@atmel.com>
Message-ID: <87od80fnnu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> You could generate scripts to build all packages...

 Ulf> Then you can remove ALL package/*/*.mk.

 Ulf> I do not think this is an improvement.

 Ulf> Why is it better to run a script than to be able to configure to
 Ulf> generate an SD-Card as part of the make?

Sure, but where to stop? I think most if not all disk based needs are
covered by the existing tar/ext2/ext3 support.

Adding more config options for really specialized stuff doesn't
increase usability imho.

 >>> I still think it's needless bloat.

 Ulf> Do you generate SD-Cards images or not?
 Ulf> Have a feeling you here define bloat as something you do not use.

Not in a current project, no - But I have (or rather CF cards, but
that's the same). What's the problem with the existing ext2 support?

-- 
Bye, Peter Korsgaard
