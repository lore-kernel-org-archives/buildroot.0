From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:02:12 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: conditionally add gpl
 license
In-Reply-To: <20180503203621.GD2453@scaer> (Yann E. MORIN's message of "Thu, 3
 May 2018 22:36:21 +0200")
References: <1523502130-21870-1-git-send-email-danomimanchego123@gmail.com>
 <20180503203621.GD2453@scaer>
Message-ID: <87sh6gday3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Danomi, All,
 > On 2018-04-11 23:02 -0400, Danomi Manchego spake thusly:
 >> Currently, GST1_PLUGINS_BAD_LICENSE_FILES starts out set to
 >> both the GPL COPYING file and the LGPL COPYING.LIB file, but
 >> the GST1_PLUGINS_BAD_LICENSE handling only claims LGPL, and
 >> then intelligently adds GPL if needed.  This change moves the
 >> GPL file addition to the same conditional clause so that the
 >> GPL file is included in the legal-info location only if GPL
 >> code is actually used.
 >> 
 >> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
