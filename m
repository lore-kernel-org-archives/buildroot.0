From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:46:32 +0200
Subject: [Buildroot] [PATCH 1/4] DEVELOPERS: Fix file order list
 maintained by me
In-Reply-To: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
References: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20180905234632.31088798@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Mon,  3 Sep 2018 10:26:09 +0200, Jagan Teki wrote:

> -F:	configs/amarula_a64_relic_defconfig

The support for this board is not merged yet. If you send patches that
depend on other patches, you should send them all in a patch series.

But in this case, you should have rather based this patch series on
master or next, and not on your branch that contains some unrelated
work such as the Amarula A64 Relic board support.

Anyway, I've fixed this up, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
