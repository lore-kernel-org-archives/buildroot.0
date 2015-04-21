From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 22:18:06 +0200
Subject: [Buildroot] [PATCH 2/3] package/cache-calibrator: add hash
In-Reply-To: <20150421172246.GB4262@free.fr>
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
 <1429583936-13335-2-git-send-email-fabio.porcedda@gmail.com>
 <87iocqt0wq.fsf@dell.be.48ers.dk> <20150421172246.GB4262@free.fr>
Message-ID: <20150421221806.30417424@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:22:46 +0200, Yann E. MORIN wrote:

> Do we have other such packages (I think I read there was another
> version-less package for now)?

For makedevs, we simply bundle the source code in Buildroot. But it's
more a core tool, that we have improved for our own purposes.

calibrator.c is only 38KB, so we could integrate it in
package/cache-calibrator/ directly, but it's not very nice either.

Thoas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
