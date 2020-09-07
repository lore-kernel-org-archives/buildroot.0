From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:47:28 +0200
Subject: [Buildroot] [PATCH] package/re2: build host as shared libs
In-Reply-To: <20200907163039.374342-1-buildroot@heine.tech>
References: <20200907163039.374342-1-buildroot@heine.tech>
Message-ID: <20200907224728.7b73cdb1@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 18:30:39 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> host-grpc needs re2 as shared lib.
> Set this via cmake config flag.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a98/a98d3203f68f0f929c544537244e7621e80ce0a1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/re2/re2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
