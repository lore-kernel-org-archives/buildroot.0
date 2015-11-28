From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:10:11 +0100
Subject: [Buildroot] [PATCH 1/1] gpsd: enable kpps support
In-Reply-To: <1448641557-18100-1-git-send-email-james.knight@rockwellcollins.com>
References: <1448641557-18100-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151128151011.278e75e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 27 Nov 2015 11:25:57 -0500, James Knight wrote:
> GPSD has the ability to support KPPS. Its enablement is determined
> primarily from the existence of `sys/timepps.h`. This file is provided
> from the pps-tools package. Adjusting GPSD's Makefile to depend on the
> pps-tools package if a developer has included pps-tools as part of a
> build.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/gpsd/gpsd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
