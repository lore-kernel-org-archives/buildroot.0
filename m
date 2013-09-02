From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 22:39:56 +0200
Subject: [Buildroot] [PATCH] legacy: marked BR2_PACKAGE_GCC_TARGET and
	BR2_HAVE_DEVFILES as removed
In-Reply-To: <20130830093340.6b6e521a@skate> (Thomas Petazzoni's message of
 "Fri, 30 Aug 2013 09:33:40 +0200")
References: <1377835739-2249-1-git-send-email-s.martin49@gmail.com>
 <20130830093340.6b6e521a@skate>
Message-ID: <87eh979cv7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Samuel Martin,
 Thomas> On Fri, 30 Aug 2013 06:08:59 +0200, Samuel Martin wrote:
 >> These 2 symbols were removed when the gcc has been converted to the
 >> Buildroot package infrastructures.
 >> 
 >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> This should certainly be merged for 2013.08.

Ups, I somehow missed this :/

It seems like we're having enough fixes for a bugfix release (neon,
ti-gfx and this), so I will most likely release a .1 by next weekend.

-- 
Bye, Peter Korsgaard
