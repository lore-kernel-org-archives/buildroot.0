From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:41:53 +0200
Subject: [Buildroot] configs/arcturus_ucls1012a: bump kernel to 4.14.140
 and u-boot version to 2019.10
In-Reply-To: <34880163-6f5d-1417-cb2f-8633cbef3489@ArcturusNetworks.com>
References: <20200808185725.40db193f@windsurf.home>
 <34880163-6f5d-1417-cb2f-8633cbef3489@ArcturusNetworks.com>
Message-ID: <20200812164153.35a6f546@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 10:58:17 -0400
Michael Durrant <mdurrant@ArcturusNetworks.com> wrote:

> Fixes: 
>   
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/674933582
> 
> Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
> ---
>  board/arcturus/aarch64-ucls1012a/post-build.sh | 5 +++++
>  configs/arcturus_ucls1012a_defconfig           | 9 +++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>  create mode 100755 board/arcturus/aarch64-ucls1012a/post-build.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
