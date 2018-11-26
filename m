From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:17:01 +0100
Subject: [Buildroot] [PATCH 1/1] flare-engine: fix debug build
In-Reply-To: <20181118213439.10404-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 22:34:39 +0100")
References: <20181118213439.10404-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7lvyfsy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
 > as Debug will add -pg (gprof) which is not always available on toolchain

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a12ae622a44bbe025c3a8b7e8e4c253b52927ae8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
