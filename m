From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 11 Jul 2008 07:38:29 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10
In-Reply-To: <20080710161237.B4EDD3C642@busybox.net>
References: <20080710161237.B4EDD3C642@busybox.net>
Message-ID: <1215754709.11647.62.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-07-10 at 09:12 -0700, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2008-07-10 09:12:36 -0700 (Thu, 10 Jul 2008)
> New Revision: 22766
> 
> Log:
> Do not use a localversion of kernel, to allow modules to be installed in the correct directory
> 

I do not like this approach, users will think they are running an
upstream kernel while they are really not. The Atmel-kernel is quite
different from upstream.

I have a fix for localversion in my GIT tree, I will send that patch to
this list for review. I just need to sort out an issue with the modules
being installed again for every make.

<snipp>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
