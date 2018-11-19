From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 16:08:27 +0100
Subject: [Buildroot] [PATCH 1/1] flare-engine: fix debug build
In-Reply-To: <20181118213439.10404-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 22:34:39 +0100")
References: <20181118213439.10404-1-fontaine.fabrice@gmail.com>
Message-ID: <87y39pp0k4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If BR2_ENABLE_DEBUG is set, use RelWithDebInfo instead of default Debug
 > as Debug will add -pg (gprof) which is not always available on toolchain

Is this RelWithDebInfo something specific to flare-engine or is that
"standard" cmake? If so, perhaps we should use it globally instead of
Debug?

Committed, thanks.

-- 
Bye, Peter Korsgaard
