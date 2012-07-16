From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jul 2012 05:12:21 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120716051221.D726B90BED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #13 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-16 05:12:21 UTC ---
(In reply to comment #12)
> (In reply to comment #11)
> > Created attachment 4412 [details]
> > new config file
> > 
> > the build ends with the can't find fenv.h file error.
> 
> fenv.h comes with uClibc when C99 floating point environment is enabled.
> This feature is disabled in the default uclibc-0.9.33 defconfig file.
> 
> You can change this running 'make uclibc-menuconfig' in "Target Architecture
> Features and Options >> Enable C99 Floating-point environment", but this will
> require to rebuild the cross-toolchain.

It builds now perfectly.
Thank you!

PS
How would i have know to run 'make uclibc-menuconfig' ... ? There was no such
problem in the previous version (release) of buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
