From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 14:20:28 +0200
Subject: [Buildroot] [PATCH] libmemcached: disable tests
In-Reply-To: <1405771553-23073-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405771553-23073-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140719142028.31672160@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 19 Jul 2014 09:05:53 -0300, Gustavo Zacarias wrote:
> Disable test libraries and programs, even though it needs to autoreconf
> it's a good tradeoff since it cuts the build time by half, and avoids
> build issues with extra dependencies that aren't properly checked for.
> Fixes:
> http://autobuild.buildroot.net/results/739/739ae9b2f28486dec8900aa584145d2d38f44331/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
