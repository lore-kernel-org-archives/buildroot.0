From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:22:18 +0100
Subject: [Buildroot] [PATCH 3/3] package/binutils: remove support for
 2.27
In-Reply-To: <20180129215631.7238-3-romain.naour@gmail.com>
References: <20180129215631.7238-1-romain.naour@gmail.com>
 <20180129215631.7238-3-romain.naour@gmail.com>
Message-ID: <20180129232218.70415496@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jan 2018 22:56:31 +0100, Romain Naour wrote:
> Now that binutils 2.30 has been introduced, and we have moved to
> 2.29.1 as the default version, it is time to drop support for binutils
> 2.27.
> 
> Also use xz-compressed tarball for all official supported version.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/binutils/Config.in.host | 7 -------
>  package/binutils/binutils.hash  | 1 -
>  package/binutils/binutils.mk    | 8 --------
>  3 files changed, 16 deletions(-)

Config.in.legacy handling is missing here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
