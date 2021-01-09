From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 23:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with
 musl-1.2.0
In-Reply-To: <20200503075312.703486-1-bernd.kuhls@t-online.de>
References: <20200503075312.703486-1-bernd.kuhls@t-online.de>
Message-ID: <20210109230622.3977be20@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 May 2020 09:53:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/31b/31bf9814a5a45081cf58675a9f7fa7183b4ef0bf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

minidlna now builds fine with musl: since we bumped to minidlna 1.3.0,
there are no longer any failures in the autobuilders on minidlna.

And indeed, upstream commit 347aafa6d7275cbb44963f10cf4d12168bc3cb8c
was made to fix musl issues.

So I've marked this patch as not applicable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
