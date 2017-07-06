From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jul 2017 13:09:12 +0200
Subject: [Buildroot] [PATCH] download: allow for BR2_PRIMARY_SITE(_ONLY)
	environment override
In-Reply-To: <0b665ee9-9f6d-f612-1ade-67616281488c@grinn-global.com> (Marcin
 Niestroj's message of "Thu, 6 Jul 2017 12:01:53 +0200")
References: <20170705123359.19116-1-m.niestroj@grinn-global.com>
 <87inj7ym6z.fsf@dell.be.48ers.dk>
 <fc0894de-0269-61e4-5acd-2adbe0007bf9@grinn-global.com>
 <8760f6zynp.fsf@dell.be.48ers.dk>
 <0b665ee9-9f6d-f612-1ade-67616281488c@grinn-global.com>
Message-ID: <8737a9yg87.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

Hi,

 > I still think that using environment variable with make command instead
 > of brmake alias is more comfortable for a developer. But I get your
 > point, so I will not insist on this patch :)

I understand. The problem is that it is very difficult to remove
features once people start using it, and we try very hard to keep
Buildroot (relatively) simple. Part of this is to not have multiple ways
of doing the same thing.

Sorry.

-- 
Bye, Peter Korsgaard
