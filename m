From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 14:59:53 +0100
Subject: [Buildroot] [PATCH 1/1] chrony: enable pps support
In-Reply-To: <20161118202631.10900-1-james.knight@rockwellcollins.com>
References: <20161118202631.10900-1-james.knight@rockwellcollins.com>
Message-ID: <20161126145953.65525528@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 15:26:31 -0500, James Knight wrote:
> Chrony has the ability to support PPS. Its enablement is determined
> primarily from the existence of `sys/timepps.h`. This file is provided
> from the pps-tools package. Adjusting Chrony's Makefile to depend on the
> pps-tools package if a developer has included pps-tools as part of a
> build. Relates to 2cfc966f431c7c715b3fc11ca0467d47432fca33.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/chrony/chrony.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
