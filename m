From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Aug 2017 23:04:41 +0200
Subject: [Buildroot] [PATCH 1/1] Added support for LeMaker Banana Pi M2
 Plus board.
In-Reply-To: <1503433993-131060-1-git-send-email-mike.harmony@snapav.com>
References: <1503433993-131060-1-git-send-email-mike.harmony@snapav.com>
Message-ID: <20170822230441.3a5ff8ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Tue, 22 Aug 2017 16:33:13 -0400, mike.harmony at snapav.com wrote:
> From: Mike Harmony <mike.harmony@houselogix.com>
> 
> Signed-off-by: Mike Harmony <mike.harmony@houselogix.com>
> ---
>  board/lemaker/m2-plus/boot.cmd      |    7 +
>  board/lemaker/m2-plus/genimage.cfg  |   33 +
>  board/lemaker/m2-plus/post-build.sh |   12 +
>  configs/bananapi_m2_plus_defconfig  | 3280 +++++++++++++++++++++++++++++++++++
>  4 files changed, 3332 insertions(+)
>  create mode 100644 board/lemaker/m2-plus/boot.cmd
>  create mode 100644 board/lemaker/m2-plus/genimage.cfg
>  create mode 100755 board/lemaker/m2-plus/post-build.sh
>  create mode 100644 configs/bananapi_m2_plus_defconfig

I haven't looked in details at your submission. However, we already had
a contribution adding support for Banana Pi M2 Plus, see:

Subject: [Buildroot] [PATCH v2 2/3] Board: Add Bananapi M2 Plus support
Date: Sun, 18 Jun 2017 22:18:02 +0530

It was not merged because I had some comments, and the original
submitter didn't send an updated version.

Regarding your submission, at the very least:

 - The defconfig should be generated with "make savedefconfig", to be a
   minimal defconfig. Look at other defconfig files in configs/

 - Add yourself to the DEVELOPERS file

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
