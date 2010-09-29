From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 10:22:43 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <4CA110CC.8030009@googlemail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
	<4C95DD81.2090105@googlemail.com>
	<AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
	<4CA110CC.8030009@googlemail.com>
Message-ID: <20100929102243.4b4a1d2b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Sep 2010 23:46:52 +0200
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> Btw: Thomas preferres another solution for the init-d skript (without 
> sleep 5 init). I wasn't able to figure out clearly, why and where the 
> IP_ADDR variable is used, so I'm experimenting with the "official" 
> init-d-skript from the transmission wiki.
> Would this be a problem in your eyes?

Well, for the moment, we can keep this loop. Fix the other problems
mentionned in my latest review, and resend a new version. We'll merge
that one.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
