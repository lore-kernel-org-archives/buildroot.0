From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Sep 2014 16:53:13 +0200
Subject: [Buildroot] [PATCH v2] ARC: bump tools to 2014.08 release
In-Reply-To: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 21 Aug 2014 21:33:56 +0400")
References: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <877g1nl7dy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Now when new shiny tools are released by Synopsys we're ready for version
 > update in Buildroot.

 > Important change in this release is switching to combined "binutils-gdb" repo
 > in accordance to upstream move.

 > Following patch now is a part of the most recent relese:
 > https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/e6ab8cac627a44a7594aeb907a579d8d2f066ba5

 > So dropping it.
 > package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch

 > Since arc-2014.08 tools are still based on GCC 4.8 following patch is still
 > relevant so moving to the new folder to matxh ARC gcc bump.
 > package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch ->
 > package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Compared to v1 obsolete patch was removed and another one for gcc moved to
 > another location to match new arc gcc version.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
