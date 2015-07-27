From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:38:43 +0200
Subject: [Buildroot] [PATCH 06/12] libiscsi: Bump version
In-Reply-To: <1437943118-18060-7-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1437943118-18060-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150727233843.2502590e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:32 +0200, Maxime Hadjinlian wrote:
> Patches were applied upstream so they are removed.
> Also remove the autoreconf which has no purposes anymore
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

This is causing some regression:

  http://autobuild.buildroot.org/results/0a9/0a96f3654983ed2efc851522352dec43c1df0077/build-end.log

This is due to the fact that ld is used instead of gcc. Can you have a
look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
