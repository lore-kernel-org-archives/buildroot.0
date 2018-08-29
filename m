From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 08:59:36 +0200
Subject: [Buildroot] [PATCH] json-c: needs host-autoconf
In-Reply-To: <87ftyxyfr5.fsf@tkos.co.il>
References: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
 <20180828213557.069e855e@windsurf.home>
 <20180828213742.12bef8e7@windsurf.home> <87ftyxyfr5.fsf@tkos.co.il>
Message-ID: <20180829085936.765bec16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 07:10:38 +0300, Baruch Siach wrote:

> You are right. Updating the config.h.in timestamp is enough to avoid
> autoheader. I sent an updated patch.

Thanks a lot for looking deeper into this. Perhaps this issue should be
reported upstream, because it's really a bug in upstream's tarball.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
