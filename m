From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Aug 2010 13:17:34 +0200
Subject: [Buildroot] How to get gdb in the image
In-Reply-To: <29497355.post@talk.nabble.com>
References: <29492552.post@talk.nabble.com> <20100820191257.61821f87@surf>
	<29497355.post@talk.nabble.com>
Message-ID: <20100821131734.093cbfef@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Aug 2010 01:21:29 -0700 (PDT)
JNY <jny0@hotmail.com> wrote:

> Since adding gdb to the menuconfig, buildroot no longer makes.  I get
> the following errors and warnings:

Are you sure you have added *only* gdb ? The error message you're
showing seems to come from the uClibc test suite. I think you have
mistakenly enabled BR2_UCLIBC_INSTALL_TEST_SUITE in addition to
enabling gdb.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
