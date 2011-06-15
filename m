From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jun 2011 09:33:24 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
	disable}-{shared, static} automatically
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C603216F@ex-mb1.corp.adtran.com>
 (ANDY KENNEDY's message of "Wed, 15 Jun 2011 07:28:16 +0000")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
 <87k4cq7rdq.fsf@macbook.be.48ers.dk> <20110613001630.1281e5c3@skate>
 <874o3t9zs2.fsf@macbook.be.48ers.dk> <20110614085430.3229006e@skate>
 <87wrgn8usg.fsf@macbook.be.48ers.dk> <20110615084756.5d787906@skate>
 <F9C551623D2CBB4C9488801D14F864C603216F@ex-mb1.corp.adtran.com>
Message-ID: <87lix38s6z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:

Hi,

 ANDY> I need the static libs.  If no one else does, I do.  If you do
 ANDY> something like that, please make it configurable so I can get
 ANDY> back to the old way.

BR2_PREFER_STATIC_LIB is not going away. This is purely about the
semantics of !BR2_PREFER_STATIC_LIB.

-- 
Bye, Peter Korsgaard
