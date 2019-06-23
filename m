From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:18:34 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/weston: fix build with headers < 4.4
In-Reply-To: <20190610120926.5150-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Jun 2019 14:09:26 +0200")
References: <20190610120926.5150-1-fontaine.fabrice@gmail.com>
Message-ID: <87wohcawdh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > weston includes input-event-codes.h since version 5.0.91 and
 > https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff

 > input-event-codes.h is available only since kernel 4.4 and
 > https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12

 > To fix this build failure, replace include on linux/input-event-codes.h
 > by linux/input.h

 > Fixes:
 >  - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v3 -> v4:
 >  - Fix commit message

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
