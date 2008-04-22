From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 22 Apr 2008 20:47:46 +0200
Subject: [Buildroot] Improper device nodes
	createdinside	project_build_arm/uclibc/root/dev/
References: <16803332.post@talk.nabble.com><20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com><20080422005042.GA19794@cloud.net.au><8763uaqs3b.fsf@macbook.be.48ers.dk><20080422095909.GA31643@cloud.net.au><040301c8a49d$c1408170$050514ac@atmel.com>
	<87tzhtoihz.fsf@macbook.be.48ers.dk>
Message-ID: <044f01c8a4a9$cfed41c0$050514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> Ulf> Maybe we should have a configuration item allowing this to happen
> Ulf> automatically using "sudo".
> 
> I respectfully disagree. It doesn't add anything to using the tarball
> option, and it opens up a can of worms (system libs getting
> overridden).
> 
> -- 
> Bye, Peter Korsgaard

Using the tarball is a manual process.
Manual processes are error-prone.
I agree that it is dangerous though, and needs to be carefully thought through.



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
