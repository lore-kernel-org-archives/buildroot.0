From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 20:51:01 +0200
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for
 target
In-Reply-To: <20130729021746.EF4355C127@zaphod.pbhware.com>
References: <20130729021746.EF4355C127@zaphod.pbhware.com>
Message-ID: <20130729205101.17741846@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul B. Henson,

On Sun, 28 Jul 2013 19:11:50 -0700, Paul B. Henson wrote:
> Signed-off-by: Paul B. Henson <henson@acm.org>
> ---
>  package/mtd/Config.in |    6 ++++++
>  package/mtd/mtd.mk    |    7 +++++++
>  2 files changed, 13 insertions(+), 0 deletions(-)

Applied, thanks. I've made the changes suggested by Thomas De
Schampheleire, as well as added the necessary 'depends on' statements
for the requires toolchain features.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
