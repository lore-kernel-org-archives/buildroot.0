From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 16:35:15 +0100
Subject: [Buildroot] [PATCH] bash: remove CC variable when calling make
In-Reply-To: <1261836208.5867.15.camel@coalu.atr> (Lionel Landwerlin's message
	of "Sat, 26 Dec 2009 15:03:28 +0100")
References: <1261836208.5867.15.camel@coalu.atr>
Message-ID: <87r5pansy4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> So "/opt/whatever_toolchain/gcc --sysroot $(STAGING_DIR)" isn't
 Lionel> stripped to "/opt/whatever_toolchain/gcc", making gcc to look at
 Lionel> $(ORIGINAL_TOOLCHAIN_DIRECTORY)/usr/include instead of
 Lionel> $(STAGING_DIR)/usr/include. For more CC is already filled when
 Lionel> running the configure script.

 Lionel> This problem should only be visible with an external toolchain.

Committed, thanks.

-- 
Bye, Peter Korsgaard
