From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jan 2009 08:58:31 +0100
Subject: [Buildroot] svn
	commit:trunk/buildroot/target/device/Atmel/arch-avr32:kernel-patches-2.6.27.6
In-Reply-To: <FC51A1FF4A8643D8A0C0B2C0DA0C5E2D@aeglos> (Ulf Samuelsson's
	message of "Fri\, 2 Jan 2009 23\:44\:37 +0100")
References: <20081220221939.4935476CEB@busybox.osuosl.org>
	<873agf8bnm.fsf@macbook.be.48ers.dk>
	<FC51A1FF4A8643D8A0C0B2C0DA0C5E2D@aeglos>
Message-ID: <87aba8253s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> The way it works now the patches are for a specific major/minor
 Ulf> combination but you select which kernel you want to use, and
 Ulf> then you select which patchset.  You can apply 2.6.27.6 on top
 Ulf> of 2.6.27.10 if you want to, but the name indicates which kernel
 Ulf> it was intended for, and the further away you go in terms of
 Ulf> major/minor revisions the higher the risk that the patch will
 Ulf> not apply.

But why are you checking in something that is already obsolete? Why
not base on 2.6.27.10 right away?

 Ulf> When I get time, I will implement downloading the patchset
 Ulf> instead of storing it in the svn.
 Ulf> Then the size will go down.

And what about the older patches, can they go away?

-- 
Bye, Peter Korsgaard
