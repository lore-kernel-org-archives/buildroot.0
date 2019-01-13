From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:16:59 +0100
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.3.1
In-Reply-To: <20190112190230.13556-1-asafka7@gmail.com>
References: <20190112190230.13556-1-asafka7@gmail.com>
Message-ID: <20190113141659.7fb4a911@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 21:02:30 +0200, Asaf Kahlon wrote:
> Remove the patches as they're already on upstream.
> As a consequence, no need to autoreconf anymore.
> Also added license hashes.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...-serach-for-dladdr-only-on-libunwind.patch | 45 ------------
>  ...nclude.m4-check-if-latomic-is-needed.patch | 71 -------------------
>  package/zeromq/zeromq.hash                    |  8 ++-
>  package/zeromq/zeromq.mk                      |  4 +-
>  4 files changed, 6 insertions(+), 122 deletions(-)
>  delete mode 100644 package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
>  delete mode 100644 package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
