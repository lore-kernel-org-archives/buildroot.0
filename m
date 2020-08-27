From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:08:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 3.0
In-Reply-To: <20200827110539.30185-1-heiko.thiery@gmail.com>
References: <20200827110539.30185-1-heiko.thiery@gmail.com>
Message-ID: <20200827230846.4f6f9f8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 13:05:39 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> - remove patch that is in new version
> - update indentation in hash file (two spaces)
> 
> Run tests:
> 
>              br-arm-full [1/6]: OK
>   br-arm-cortex-a9-glibc [2/6]: OK
>    br-arm-cortex-m4-full [3/6]: OK
>           br-x86-64-musl [4/6]: OK
>       br-arm-full-static [5/6]: OK
>             sourcery-arm [6/6]: OK
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...fix-building-with-new-kernel-headers.patch | 55 -------------------
>  package/linuxptp/linuxptp.hash                | 10 ++--
>  package/linuxptp/linuxptp.mk                  |  2 +-
>  3 files changed, 6 insertions(+), 61 deletions(-)
>  delete mode 100644 package/linuxptp/0002-fix-building-with-new-kernel-headers.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
