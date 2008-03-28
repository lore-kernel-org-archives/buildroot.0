From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 15:01:47 +0100
Subject: [Buildroot] Size of svn
In-Reply-To: <021701c890d9$3e8c6370$dcc4af0a@atmel.com> (Ulf Samuelsson's
	message of "Fri\, 28 Mar 2008 14\:08\:31 +0100")
References: <021701c890d9$3e8c6370$dcc4af0a@atmel.com>
Message-ID: <87bq4zj6b8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> I looked through the svn.

Thanks.

 Ulf> The avr32 boards (target/device/Atmel/atngw100_<xxx>)
 Ulf> recently added by John Voltz, each have their own patchset, 
 Ulf> and the large patches are duplications of the patches in
 Ulf> (target/device/Atmel/arch-avr32/kernel-patches-<version>)
 Ulf> That adds 2-3 MB and should be cleaned up.

Who will do that? John? You?

 Ulf> The major remaining part in terms of size in target/device/Atmel 
 Ulf> are kernel patches for at91 and avr32 for different kernel versions.
 Ulf> It would be possible to download these patches as well
 Ulf> from an ftpserver, but the infrastructure in "target/linux" is
 Ulf> not there yet. I think this is 5-6 MB.

 Ulf> ==========================
 Ulf> The toolchain patches for avr32 added by John,
 Ulf> is IMHO unneccessary and can be removed. 
 Ulf> IIRC they add 7-8 MB to the svn size.

It would be nice to get rid of those as well.

 Ulf> The avr32 toolchain can (and should)
 Ulf> be built using the prepatched source.
 Ulf> If patches are required, then they can be located in the
 Ulf> (target/device/Atmel/toolchain) directory.

-- 
Bye, Peter Korsgaard
