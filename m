From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:16:57 +0200
Subject: [Buildroot] [PATCH 1/2] libnfs: Without native RPC use libtirpc
In-Reply-To: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150806091657.618c4e10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Apr 2015 14:54:30 +0200, Maxime Hadjinlian wrote:
> As it's done with nfs-utils, use libtirpc when no native rpc support
> exists in the toolchain.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/libnfs/Config.in | 5 +----
>  package/libnfs/libnfs.mk | 4 ++++
>  2 files changed, 5 insertions(+), 4 deletions(-)

Both of your patches had comments, but you never addressed them. So
I've marked the two patches as Changes Requested. Please address the
comments and send an updated version. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
