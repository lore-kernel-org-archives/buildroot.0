From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2012 10:48:29 +0100
Subject: [Buildroot] [PATCH] AVR32: fix libusb build
In-Reply-To: <50AF457A.8000305@free-electrons.com> (Maxime Ripard's message of
 "Fri, 23 Nov 2012 10:44:26 +0100")
References: <1353662196-3350-1-git-send-email-maxime.ripard@free-electrons.com>
 <874nkgfyhp.fsf@dell.be.48ers.dk>
 <50AF457A.8000305@free-electrons.com>
Message-ID: <87zk28ejki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Fixes most of the recent avr32 breakages, such as
 Maxime> http://autobuild.buildroot.org/results/f418b6c0b026891c27467f61444b6eac8c105681
 Maxime> or
 Maxime> http://autobuild.buildroot.org/results/1a9e571998bc0a40822dca84267abbdd969bab5e
 >> 
 >> Committed, thanks. Does this mean we can revert 2424cc6 (libhid: disable
 >> on avr32)?

 Maxime> Yes, from the build logs, it looks like it was the same error, so this
 Maxime> patch should fix it as well.

Ok, will revert - Thanks.

-- 
Bye, Peter Korsgaard
