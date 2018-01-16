From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 21:03:39 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: use -ffp-contract=off on
 MIPS in the wrapper when needed
In-Reply-To: <1516128616-20127-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1516128616-20127-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20180116210339.4c541835@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 19:50:16 +0100, Johannes Schmitz wrote:
> This fix is necessary for to build for MIPS, for example for the MIPS
> XBurst architecture used on ci20 boards.
> 
> GCC has replaced (no)mfused-madd with ffp-contract.
> Find more details and a long discussion at
> https://gcc.gnu.org/ml/gcc-patches/2015-06/msg00876.html
> 
> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>

Within just 3 minutes, you sent this patch 3 times. Two times the exact
same version, and one time a different version. There is also no
version number on the patches, making it very difficult to understand
what is *the* correct patch.

Could you add a version number to your patches (git format-patch -v X),
include a changelog between version (below the --- sign that follows
the Signed-off-by line) and try to avoid sending 3 times the same patch
in a row ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
