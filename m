From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:07:46 +0200
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.08 release
In-Reply-To: <1408545394-4345-1-git-send-email-abrodkin@synopsys.com>
References: <1408545394-4345-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140821150746.33053245@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 20 Aug 2014 18:36:34 +0400, Alexey Brodkin wrote:
> Now when new shiny tools are released by Synopsys we're ready for version
> update in Buildroot.
> 
> Important change in this release is switching to combined "binutils-gdb" repo
> in accordance to upstream move.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> Would be really nice to squeeze this commit into the next RC (of v2014.08)
> so it will become a part of the upcoming Buildroot release.
> 
> Otherwise we'll stuck with previous ARC tools until 2014.11 release.
> ---
>  package/binutils/Config.in.host | 2 +-
>  package/binutils/binutils.mk    | 2 +-
>  package/gcc/Config.in.host      | 2 +-
>  package/gdb/Config.in.host      | 2 +-
>  package/gdb/gdb.mk              | 2 +-
>  package/uclibc/Config.in        | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

I think this overlooks the fact that there are binutils and gcc patches
in package/binutils/ and package/gcc/ specifically for the ARC
architecture versions. Those patches should be updated, or a
justification be provided as to why they are no longer necessary. And
in any case, the old, no longer referenced patches, should be removed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
