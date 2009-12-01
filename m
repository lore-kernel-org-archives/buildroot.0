From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Dec 2009 16:34:20 +0100
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
	OS X
In-Reply-To: <4B153461.1030404@usask.ca> (Nicholas Kinar's message of "Tue, 01
	Dec 2009 09:21:05 -0600")
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
Message-ID: <873a3ulncz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Kinar <n.kinar@usask.ca> writes:

Hi,


 Nicholas> Here is where buildroot-2009.08 crashes:

FYI, 2009.11 is out.

 Nicholas> Command not found
 Nicholas>  HOSTCC extra/locale/gen_locale

Locales might be different on MacOSX - uclibc builds these using
information from the host. You might have more luck by disabling locale
support for now (BR2_ENABLE_LOCALE)

-- 
Bye, Peter Korsgaard
