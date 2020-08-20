From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:12:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: fix build
 with dovecot 2.3.11.3
In-Reply-To: <20200820061744.293397-1-bernd.kuhls@t-online.de>
References: <20200820061744.293397-1-bernd.kuhls@t-online.de>
Message-ID: <20200821001249.63b3adc8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Aug 2020 08:17:44 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> An alternative fix would be to cherry-pick
> https://git.buildroot.net/buildroot/commit/?h=next&id=042656980b306e233ec1651b90b8bbc7680bd3d6
> to the master branch.

I have chosen your alternative solution, which seemed safer than
backporting several patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
