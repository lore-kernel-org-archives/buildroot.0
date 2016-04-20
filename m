From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 11:28:39 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new
 package
In-Reply-To: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
References: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160420112839.43c4d35d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 11:22:54 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fixes #8856

Are you sure this is sufficient to fix the bug? Doesn't python-tornado
also needs to select this new package when Python 2 is used?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
