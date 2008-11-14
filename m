From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 12:15:13 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20081114111259.5e2d902c@surf> (Thomas Petazzoni's message of
	"Fri\, 14 Nov 2008 11\:12\:59 +0100")
References: <20081114100645.192BD3C8EE@busybox.net>
	<20081114111259.5e2d902c@surf>
Message-ID: <87zlk2o8xq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I don't really get what's all this toolchain-related stuff in
 Thomas> target/device/. Even when using a binary external toolchain, all the
 Thomas> BR2_EXT_GCC_VERSION_* variables are set:

 Thomas> BR2_EXT_GCC_VERSION_4_1_2=y
 Thomas> BR2_EXT_GCC_VERSION_4_2_1=y
 Thomas> BR2_EXT_GCC_VERSION_4_2_2=y
 Thomas> BR2_EXT_GCC_VERSION_4_2_3=y
 Thomas> BR2_EXT_BINUTILS_VERSION_2_17=y
 Thomas> BR2_EXT_UCLIBC_VERSION_0_9_29=y
 Thomas> BR2_EXT_UCLIBC_VERSION_0_9_28_3=y

 Thomas> which looks a bit odd to me, since Buildroot has absolutely no power
 Thomas> over the version of the components used in an already compiled binary
 Thomas> toolchain.

 Thomas> And why is all that stuff implemented in target/device/ and not in
 Thomas> toolchain/ ?

I actually have no idea - I don't use the external toolchain stuff,
but it looks like something related to the avr32 stuff.

I've just cleaned it up slightly in preparation for adding uclibc
0.9.30.

-- 
Bye, Peter Korsgaard
