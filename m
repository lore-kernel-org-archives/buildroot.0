From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 12:00:38 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 0/4] add support for
 outdated packages to daily-mail
In-Reply-To: <20190805131544.3849-1-victor.huesca@bootlin.com>
References: <20190805131544.3849-1-victor.huesca@bootlin.com>
Message-ID: <20190815120038.43d583ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

On Mon,  5 Aug 2019 15:15:40 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (4):
>   utils/daily-mail: new data: outdated packages
>   utils/daily-mail: add outdated packages to the developer notification
>   utils/daily-mail: add outdated-packages email formating part
>   utils/daily-mail: enable outdated packages emails

Thanks a lot for this work, I have applied all 4 patches, with some
minor changes. I also did a few formatting improvements:

  https://git.buildroot.org/buildroot-test/commit/?id=ba42c3bdce31581dc9c270165ebe59393e91c51f
  https://git.buildroot.org/buildroot-test/commit/?id=2e8ae4662d473d67398bf97eaf5e40bcbbc000be
  https://git.buildroot.org/buildroot-test/commit/?id=e7ed66b8a9383de60ab59e8604df4215b1753d30

The e-mail of today (both global and per developer) was sent with your
patches applied, so those notifications about outdated packages have
been sent to many developers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
