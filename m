From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 16:21:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: drop patch
In-Reply-To: <20200912081011.18983-1-heiko.thiery@gmail.com>
References: <20200912081011.18983-1-heiko.thiery@gmail.com>
Message-ID: <20200913162136.43f01a99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Sep 2020 10:10:11 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> With updating libssh to version 0.9.5 this patch is no longer needed.
> 
> http://lists.busybox.net/pipermail/buildroot/2020-September/291986.html
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...move-version-check-for-faulty-libssh.patch | 32 -------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644 package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
