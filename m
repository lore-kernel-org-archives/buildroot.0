From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:26:16 +0200
Subject: [Buildroot] [PATCH next] cifs-utils: bump to version 6.7
In-Reply-To: <125a9bff847fe48f49fc67114169f25117f3ff25.1495653339.git.baruch@tkos.co.il>
References: <125a9bff847fe48f49fc67114169f25117f3ff25.1495653339.git.baruch@tkos.co.il>
Message-ID: <20170531222616.581708a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 May 2017 22:15:39 +0300, Baruch Siach wrote:
> Enable autoreconf because of missing install-sh.
> 
> Add upstream patch fixing build breakage with libtalloc is missing.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...001-mount.cifs-Remove-data_blob.h-include.patch | 32 ++++++++++++++++++++++
>  package/cifs-utils/cifs-utils.hash                 |  2 +-
>  package/cifs-utils/cifs-utils.mk                   |  5 +++-
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
