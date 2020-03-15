From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:12:54 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/netdata: new package
In-Reply-To: <20200312160040.3416161-1-m.niestroj@grinn-global.com>
References: <20200312160040.3416161-1-m.niestroj@grinn-global.com>
Message-ID: <20200315231254.524e5e39@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Thu, 12 Mar 2020 17:00:39 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Always provide --disable-dbengine configuration option, because we do
> not support libjudy dependency that is required otherwise.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> changes v4 -> v5:
>  - use 1.20.0 instead of 1.19.0 version
>  - libuv is hard requirement now, so it was added to dependencies
>  - zlib is hard requirement as well, because it is needed to properly
>    compile project (missing uLong typedef otherwise)
>  - patch solving race condition during installation has been dropped,
>    because it is already part of 1.20.0

Following the feedback from Carlos on the init script, I've marked this
series as Changes Requested. Could you respin a new version, I think
it's very close from being merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
