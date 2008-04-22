From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Apr 2008 20:24:24 +0200
Subject: [Buildroot] Improper device nodes
	createdinside	project_build_arm/uclibc/root/dev/
In-Reply-To: <040301c8a49d$c1408170$050514ac@atmel.com> (Ulf Samuelsson's
	message of "Tue\, 22 Apr 2008 18\:40\:53 +0200")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<8763uaqs3b.fsf@macbook.be.48ers.dk>
	<20080422095909.GA31643@cloud.net.au>
	<040301c8a49d$c1408170$050514ac@atmel.com>
Message-ID: <87tzhtoihz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Maybe we should have a configuration item allowing this to happen
 Ulf> automatically using "sudo".

I respectfully disagree. It doesn't add anything to using the tarball
option, and it opens up a can of worms (system libs getting
overridden).

-- 
Bye, Peter Korsgaard
