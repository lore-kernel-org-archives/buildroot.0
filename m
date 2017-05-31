From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:59:16 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/fwup: bump version to
 0.14.3
In-Reply-To: <20170528150038.29202-1-bernd.kuhls@t-online.de>
References: <20170528150038.29202-1-bernd.kuhls@t-online.de>
Message-ID: <20170531215916.77fa4f92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 17:00:38 +0200, Bernd Kuhls wrote:
> Added patch to fix uclibc build.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fwup/0001-Fix-uclibc-build.patch | 36 ++++++++++++++++++++++++++++++++
>  package/fwup/fwup.hash                   |  2 +-
>  package/fwup/fwup.mk                     |  2 +-
>  3 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 package/fwup/0001-Fix-uclibc-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
