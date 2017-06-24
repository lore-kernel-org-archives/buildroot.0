From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:06:38 +0200
Subject: [Buildroot] [PATCH v2] package/dt-utils: new package
In-Reply-To: <20170623103757.26747-1-m.niestroj@grinn-global.com>
References: <20170623103757.26747-1-m.niestroj@grinn-global.com>
Message-ID: <20170624120638.19edfd42@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Jun 2017 12:37:57 +0200, Marcin Niestroj wrote:
> Add two upstreamable patches for this package to fix uClibc
> and musl builds.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v1 -> v2:
>  * Added Config.in comment about udev dependency (suggested by Thomas)
>  * Use SPDX licence code (sugggested by Thomas)
>  * Add patch for uClibc build (fail noticed by Thomas)
>  * Add patch for musl build

Applied to master, thanks. Please submit the two patches you have to
the upstream dt-utils project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
