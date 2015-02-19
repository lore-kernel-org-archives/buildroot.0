From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:50:42 +0100
Subject: [Buildroot] [PATCH v2] autobuild-run: do not build cdrkit using
 an incompatible toolchain
In-Reply-To: <1424087320-26677-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424087320-26677-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150219225042.6d7d09c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Feb 2015 11:48:40 +0000, Vicente Olivert Riera wrote:
> This MIPS-uClibc-Static toolchain can't build cdrkit. The issue was
> reported upstream on October-2014:
> 
> http://lists.busybox.net/pipermail/uclibc/2014-October/048699.html
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b1ec2e994c9b1f2629f37f54e04b228ad13ce3ca/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
