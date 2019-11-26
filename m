From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:54:57 +0100
Subject: [Buildroot] [PATCH 1/1] configs/nanopi_neo: deterine roofs
 partition size automatically
In-Reply-To: <20191126090352.11728-1-viktar.palstsiuk@promwad.com>
References: <20191126090352.11728-1-viktar.palstsiuk@promwad.com>
Message-ID: <20191126225457.53a6a030@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 12:03:52 +0300
Viktar Palstsiuk <viktar.palstsiuk@promwad.com> wrote:

> Let genimage determine rootfs partition size based on the filesystem image size
> 
> Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
> ---
>  board/friendlyarm/nanopi-neo/genimage.cfg | 1 -
>  configs/nanopi_neo_defconfig              | 2 --
>  2 files changed, 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
