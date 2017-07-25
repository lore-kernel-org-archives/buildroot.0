From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:53:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump version to 2.0.15
In-Reply-To: <20170724184016.21993-1-bernd.kuhls@t-online.de>
References: <20170724184016.21993-1-bernd.kuhls@t-online.de>
Message-ID: <20170725215339.48cd1e37@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 20:40:16 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> 
> 0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=2f6f6d6fef7872647cacc6741ac35ac2b4df7ed5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 38 ----------------------
>  package/kexec/kexec.hash                           |  2 +-
>  package/kexec/kexec.mk                             |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
