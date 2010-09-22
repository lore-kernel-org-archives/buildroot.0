From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Sep 2010 00:06:54 +0100
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <4C9A6667.90603@googlemail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
	<4C95DD81.2090105@googlemail.com>
	<AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
	<4C9A6667.90603@googlemail.com>
Message-ID: <20100923000654.01071f41@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Sep 2010 22:26:15 +0200
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> Is a positive test sufficient for you to have a closer look at it?

Yes, of course! I just send a review.

> Just for the protocol, transmission build breaks with activated 
> config-cache. If I use it, I have to remove 
> outbut/build/transmission-2.04 and run make flush;make.

The configuration cache has been disabled by default since just before
the release of 2010.08. The current consensus seems to be that we
should simply get rid of this option completely, because it cannot be
really reliable.

Speed-up in the build process can come from parallel building of
different packages, but this needs some quite heavy changes in our
package infrastructure.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
