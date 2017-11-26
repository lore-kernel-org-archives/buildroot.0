From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:29:58 +0100
Subject: [Buildroot] [PATCH 1/1] mesa3d: fix build with
 BR2_SHARED_STATIC_LIBS
In-Reply-To: <20171105104958.28634-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Nov 2017 11:49:58 +0100")
References: <20171105104958.28634-1-fontaine.fabrice@gmail.com>
Message-ID: <87indwenjd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mesa3d does not allow to enable both static and shared libraries so if
 > BR2_SHARED_STATIC_LIBS is set, disable static

 > Fixes https://bugs.busybox.net/show_bug.cgi?id=10326

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
