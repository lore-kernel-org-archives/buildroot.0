From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:29:49 +0100
Subject: [Buildroot] [PATCH v2 1/2] libevdev: new package
In-Reply-To: <1387551924-4824-2-git-send-email-anaumann@ultratronik.de>
References: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
 <1387551924-4824-2-git-send-email-anaumann@ultratronik.de>
Message-ID: <20131226232949.572fda54@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Naumann,

On Fri, 20 Dec 2013 16:05:23 +0100, Andreas Naumann wrote:
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/Config.in            |  1 +
>  package/libevdev/Config.in   |  6 ++++++
>  package/libevdev/libevdev.mk | 18 ++++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/libevdev/Config.in
>  create mode 100644 package/libevdev/libevdev.mk

Thanks, applied, after fixing the license information and the
autoreconf comment.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
