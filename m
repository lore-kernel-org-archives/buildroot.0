From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 15:01:49 +0100
Subject: [Buildroot] [PATCH/next v3 5/5] configs/beaglebone_qt5: don't
 use custom post-image script
In-Reply-To: <20191115125001.28255-6-unixmania@gmail.com>
References: <20191115125001.28255-1-unixmania@gmail.com>
 <20191115125001.28255-6-unixmania@gmail.com>
Message-ID: <20191230150149.5a6909b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 09:50:01 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Use support/scripts/genimage.sh, instead, which prevents duplicating
> TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.
> 
> Use a post-build script to copy uEnv.txt to BINARIES_DIR, as made for
> beaglebone.
> 
> Drop the post-image script.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  board/beaglebone/post-image.sh   | 29 -----------------------------
>  configs/beaglebone_qt5_defconfig |  4 +++-
>  2 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100755 board/beaglebone/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
