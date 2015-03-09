From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:06:23 +0100
Subject: [Buildroot] [PATCH 1/1 v3] eudev: fix dependency on kernel
 headers version
In-Reply-To: <1425901067-27699-1-git-send-email-swexru@gmail.com>
References: <1425901067-27699-1-git-send-email-swexru@gmail.com>
Message-ID: <20150309140623.6217302c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Mednyy,

On Mon,  9 Mar 2015 14:37:47 +0300, Alexey Mednyy wrote:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  ...c-don-t-die-on-missing-linux-btrfs.h-fixe.patch | 37 ++++++++++++++++++++++
>  package/eudev/eudev.mk                             |  2 ++
>  system/Config.in                                   |  6 ++--
>  3 files changed, 41 insertions(+), 4 deletions(-)
>  create mode 100644 package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch

Thanks, applied after doing a few changes:

[Thomas:
  - indicate upstream commit id, as suggested by Baruch.
  - add SoB of Alexey inside the patch itself.
  - adjust sequence number to 0003.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
