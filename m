From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jun 2011 08:37:19 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
	disable}-{shared, static} automatically
In-Reply-To: <20110614085430.3229006e@skate> (Thomas Petazzoni's message of
 "Tue, 14 Jun 2011 08:54:30 +0200")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
 <87k4cq7rdq.fsf@macbook.be.48ers.dk> <20110613001630.1281e5c3@skate>
 <874o3t9zs2.fsf@macbook.be.48ers.dk> <20110614085430.3229006e@skate>
Message-ID: <87wrgn8usg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> So I think we should just leave it as it is for now.

 Thomas> Ok. Thanks a lot for doing this testing!

Another more serious issue is that some non-library packages like bmon
interprete --enable-static as link the binary statically, leading to
bloat (E.G. ~900KB instead of ~100KB).

-- 
Bye, Peter Korsgaard
