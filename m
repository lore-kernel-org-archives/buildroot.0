From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 22:31:17 +0200
Subject: [Buildroot] PPC won't build with soft float
In-Reply-To: <49CFD553.7030909@PinsonConsulting.com> (Chris Elliott's message
	of "Sun\, 29 Mar 2009 16\:08\:51 -0400")
References: <49CFD553.7030909@PinsonConsulting.com>
Message-ID: <87r60gcbqi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Elliott <Chris@PinsonConsulting.com> writes:

 Chris> Recently I have been unable to build when soft float is set.  I have
 Chris> tried 20090323 and 20090329.  The configuration is below.  It fails
 Chris> saying that the C compiler cannot create executables.  The failure is
 Chris> in libmudflap.  Checking config.log I see the specific error is
 Chris> ".../gcc-4.3.3-final/./gcc/libgcc_s.so: undefined reference to
 Chris> copysignl'"  Is there a fix or workaround?

Strange, that used to work. Does it work if you disable
BR2_GCC_SHARED_LIBGCC? What host distribution do you use?

-- 
Bye, Peter Korsgaard
