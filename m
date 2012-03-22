From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 22:48:36 +0100
Subject: [Buildroot] [git commit] kmod: add option to install module
	utilities
In-Reply-To: <201203222237.51909.arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 22 Mar 2012 22:37:51 +0100")
References: <20120322150326.7CEA39693E@busybox.osuosl.org>
 <201203222237.51909.arnout@mind.be>
Message-ID: <87r4wk1f4b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Thursday 22 March 2012 16:03:12 Peter Korsgaard wrote:
 >> +config BR2_PACKAGE_KMOD_TOOLS

 >> +???????bool "kmod utilities"

 >> +???????help

 >> +?????????Install kmod module utilities (depmod, insmod, lsmod,

 >> +?????????modinfo, modprobe, rmmod).

 Arnout> Shouldn't this depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

Arguably it should (even though I would like us to consider getting rid
of that option).

-- 
Bye, Peter Korsgaard
