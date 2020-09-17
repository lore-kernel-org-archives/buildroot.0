From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:33:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/doxygen: disable shared libs
 for host
In-Reply-To: <20200916100212.2903033-2-buildroot@heine.tech>
References: <20200916100212.2903033-1-buildroot@heine.tech>
 <20200916100212.2903033-2-buildroot@heine.tech>
Message-ID: <20200917223355.7fe681ee@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 12:02:09 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> doxygen fails to build with BUILD_SHARED_LIBS=ON as it only
> for some targets honors this flag and links the rest static.
> So enforce BUILD_SHARED_LIBS=OFF for this package.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/doxygen/doxygen.mk | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
