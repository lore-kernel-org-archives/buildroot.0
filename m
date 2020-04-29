From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 23:23:46 +0200
Subject: [Buildroot] [PATCH 1/5] board/odroidc2: remove unused files
In-Reply-To: <20200418151020.17197-1-daggs@gmx.com>
References: <20200418151020.17197-1-daggs@gmx.com>
Message-ID: <20200429232346.7eed0e36@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 18:10:16 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> remove all the odroidc2 board related files.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  board/hardkernel/odroidc2/boot.ini      | 176 ------------------------
>  board/hardkernel/odroidc2/genimage.cfg  |  27 ----
>  board/hardkernel/odroidc2/post-image.sh |  19 ---
>  board/hardkernel/odroidc2/readme.txt    |  53 -------
>  4 files changed, 275 deletions(-)
>  delete mode 100644 board/hardkernel/odroidc2/boot.ini
>  delete mode 100644 board/hardkernel/odroidc2/genimage.cfg
>  delete mode 100755 board/hardkernel/odroidc2/post-image.sh
>  delete mode 100644 board/hardkernel/odroidc2/readme.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
