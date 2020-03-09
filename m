From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 23:12:03 +0100
Subject: [Buildroot] [PATCH v6 03/28] qt5: Convert straightforward
 packages to qmake infra
In-Reply-To: <20200217212350.29750-4-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-4-anaumann@ultratronik.de>
Message-ID: <20200309231203.6eb62e0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 17 Feb 2020 22:23:25 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> This converts all qmake packages to the new infra for which no custom
> environments, option or additional hooks are needed.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

I've applied to master, after:

 (1) Splitting the qextserialport change to its own patch, since this
     package is not in package/qt5

 (2) Rebasing on master, where changes occurred with the removal of Qt
     5.6 support.

 (3) Dropping the explicit qt5base dependency, since it is now implied
     by the qmake-package infrastructure.

Do not hesitate to carefully review the patches I have pushed, it was a
lot of mechanical change, so a second review will certainly be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
