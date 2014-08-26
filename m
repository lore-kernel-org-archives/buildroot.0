From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 26 Aug 2014 14:49:42 +0000
Subject: [Buildroot] [PATCH v2] ARC: bump tools to 2014.08 release
In-Reply-To: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com>
References: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1409064582.6466.21.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

On Thu, 2014-08-21 at 21:33 +0400, Alexey Brodkin wrote:
> Now when new shiny tools are released by Synopsys we're ready for version
> update in Buildroot.
> 
> Important change in this release is switching to combined "binutils-gdb" repo
> in accordance to upstream move.
> 
> Following patch now is a part of the most recent relese:
> https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/e6ab8cac627a44a7594aeb907a579d8d2f066ba5
> 
> So dropping it.
> package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch
> 
> Since arc-2014.08 tools are still based on GCC 4.8 following patch is still
> relevant so moving to the new folder to matxh ARC gcc bump.
> package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch ->
> package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> Compared to v1 obsolete patch was removed and another one for gcc moved to
> another location to match new arc gcc version.

I'm wondering if there's still a chance to get this patch applied before
2014.08 release?

Regards,
Alexey
