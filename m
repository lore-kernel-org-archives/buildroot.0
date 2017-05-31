From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:11:54 +0200
Subject: [Buildroot] [PATCH] gcc: allow gcc 6.x for microblaze
 architecture
In-Reply-To: <20170531164533.GA3022@waldemar-brodkorb.de>
References: <20170531164533.GA3022@waldemar-brodkorb.de>
Message-ID: <20170531211154.1804fdfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 18:45:34 +0200, Waldemar Brodkorb wrote:
> With the two patches from gcc upstream master we
> can enable gcc 6.x for microblaze again.
> 
> For gcc 7.x only microblaze-Revert.patch would be
> required.

This comment doesn't make much sense as part of this commit log, so
I've dropped it. Could you instead send a patch that adds the relevant
patch to gcc 7.x (of course by using the next branch).

Otherwise: I've applied your patch to the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
