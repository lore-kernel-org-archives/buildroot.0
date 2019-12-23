From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:51:56 +0100
Subject: [Buildroot] [PATCH/next] modem-manager: fix order of libraries
 when linking
In-Reply-To: <20191115094741.59903-1-aleksander@aleksander.es>
References: <20191115094741.59903-1-aleksander@aleksander.es>
Message-ID: <20191223235156.4882439f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Fri, 15 Nov 2019 10:47:41 +0100
Aleksander Morgado <aleksander@aleksander.es> wrote:

> Fixes the following build failure:
>   http://autobuild.buildroot.net/results/2386d296fd00fca506053d213806200f4bca80d7/build-end.log
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>

In the mean time, modem-manager was bumped to 1.12.2, and we haven't
seen any build failures. Was this patch merged upstream perhaps?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
