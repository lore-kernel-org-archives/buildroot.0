From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:42:38 +0200
Subject: [Buildroot] [PATCH 1/2] Adding btrfs-progs host package.
In-Reply-To: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
References: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
Message-ID: <20180821234238.7d7d1ebb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

Thanks for your contribution!

On Tue, 21 Aug 2018 17:04:11 +0100, Robert J. Heywood wrote:
> Adding a new option to build the btrfs toolset for the host.
> 
> Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
> ---
>  package/Config.in.host             | 1 +
>  package/btrfs-progs/Config.in.host | 6 ++++++
>  package/btrfs-progs/btrfs-progs.mk | 4 ++++
>  3 files changed, 11 insertions(+)
>  create mode 100644 package/btrfs-progs/Config.in.host

Applied to next after fixing the commit title to:

	btrfs-progs: add host package variant

Indeed, we want all our commit title to look like this:

	<package>: <description>

This should also be fixed for your PATCH 2/2, along with the other
comments made by Yann E. Morin.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
