From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 23:03:48 +0200
Subject: [Buildroot] [PATCH] board/beaglebone: remove
 genimage_linux41.cfg
In-Reply-To: <20210322152925.3218412-1-buildroot@heine.tech>
References: <20210322152925.3218412-1-buildroot@heine.tech>
Message-ID: <20210328230348.7413e5cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 16:29:17 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Commit 5502a889dd9f065ec4694a993cfa509377da2cce
> ("configs/beaglebone_qt5: don't use custom post-image script") removed the use
> of genimage_linux41.cfg but didn't remove the file.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  board/beaglebone/genimage_linux41.cfg | 32 ---------------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644 board/beaglebone/genimage_linux41.cfg

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
