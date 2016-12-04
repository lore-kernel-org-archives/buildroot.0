From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 21:49:49 +0100
Subject: [Buildroot] [PATCH 1/1] libxmlrpc: fix build without C++
 compiler
In-Reply-To: <1480866940-967-1-git-send-email-alvaro.gamez@hazent.com>
References: <20161204163745.459990e3@free-electrons.com>
 <1480866940-967-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20161204214949.7773eb07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 16:55:40 +0100, Alvaro G. M wrote:
> From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> 
> Conditionally deactivate compilation of optional C++ module.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cbf/cbff6c816606a515467d467677763533a41fc276/
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  package/libxmlrpc/0002-fix-non-cplusplus-build.patch | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Applied to master, thanks.

BTW, you shouldn't send such new patches as a reply to the older ones.
Just send normally, with no "In-Reply-To" reference.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
