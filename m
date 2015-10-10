From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:38:11 +0200
Subject: [Buildroot] [PATCH 3/3] skeleton: Remove ftp user and /home/ftp
In-Reply-To: <1443965495-12774-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443965495-12774-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151010193811.200e100b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 Oct 2015 15:31:35 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  system/skeleton/etc/group       | 1 -
>  system/skeleton/etc/passwd      | 1 -
>  system/skeleton/home/ftp/.empty | 0
>  3 files changed, 2 deletions(-)
>  delete mode 100644 system/skeleton/home/ftp/.empty

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
