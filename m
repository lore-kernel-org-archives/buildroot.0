From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 21:04:22 +0100
Subject: [Buildroot] [buildroot 0001090]: stdlibc++ fails putting a
	double in a stream.
In-Reply-To: <glt1hu$rk9$1@ger.gmane.org> (Javier Viguera's message of "Thu\,
	29 Jan 2009 20\:54\:37 +0100")
References: <9390a75d187845256e22e9a1e085fdbb@busybox.net>
	<glt1hu$rk9$1@ger.gmane.org>
Message-ID: <87tz7hq3p5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Javier" == Javier Viguera <javier.viguera@digi.com> writes:

Hi,

 Javier> I have hit this old bug with a toolchain for ARM based on
 Javier> gcc-4.0.3 and uclibc-0.9.28. The issue is described below and
 Javier> in the thread of the bug there seems to be a couple of
 Javier> patches that fixes the problem:

 >> gcc_snprintf_double_cssize.patch
 >> c_locale.h

 Javier> I am trying to get those patches, but the bug-tracking system
 Javier> seems not to have bug #1090. I seem to remember some changes
 Javier> in the buildroot servers lately, so that might be the reason
 Javier> why i cannot reach older bugs.

Yes, the old bugtracker is gone and we have a bugzilla installation
instead.

 Javier> Does anyone here still have those patches?

Sorry, not me.

-- 
Bye, Peter Korsgaard
