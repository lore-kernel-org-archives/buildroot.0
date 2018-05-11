From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:17:43 +0200
Subject: [Buildroot] [PATCH v2 0/5] package/go: fixes
In-Reply-To: <20180511205037.10078-1-anisse@astier.eu>
References: <20180511205037.10078-1-anisse@astier.eu>
Message-ID: <20180511231743.06884870@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 22:50:32 +0200, Anisse Astier wrote:

> Angelo Compagnucci (1):
>   package/go: fixing host go cross compilation
> 
> Anisse Astier (4):
>   go: cleanup cross-compilation support
>   go: add self to developers to get cc-ed for build failures
>   go: honor building with V=1 for debugging purposes
>   go: bump to version 1.10.2

Thanks a lot, series applied to master.

I've decided to apply the whole series to master because:

 - PATCH 1 solves build failures reported in the autobuilders.

 - PATCH 2 really could have been squashed into PATCH 1, it was mainly
   kept separate to preserve authorship

 - PATCH 3 is just a documentation update, useful to make sure Anisse
   gets notified on "go" breakage.

 - PATCH 4 is trivial

 - PATCH 5 is a security update (I've adjusted the commit title to
   indicate it's a security bump)

Thanks Anisse for this work, much appreciated.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
