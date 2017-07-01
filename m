From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 13:17:59 +0200
Subject: [Buildroot] [PATCH] trace-cmd: fix build with musl
In-Reply-To: <b2d16a2df6f8f42addb375ba9ee18f116e27ca50.1498738088.git.baruch@tkos.co.il>
References: <b2d16a2df6f8f42addb375ba9ee18f116e27ca50.1498738088.git.baruch@tkos.co.il>
Message-ID: <20170701131759.6f1daf51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Jun 2017 15:08:08 +0300, Baruch Siach wrote:
> Add a patch adding missing header.
> 
> Fixes:
> http://autobuild.buildroot.net/results/21f/21f6037df667918be5e4c8a91f01ddf1552915d3/
> http://autobuild.buildroot.net/results/303/30369e328189cfc5d0e281a479dea48e6dcf9903/
> http://autobuild.buildroot.net/results/7eb/7eb976b9ada0c364d2c834c91b7a09e6cfc54153/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-trace-listen-add-missing-header.patch     | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/trace-cmd/0001-trace-listen-add-missing-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
