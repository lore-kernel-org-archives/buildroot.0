From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:48:30 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove unused
 HOST_GCC_FAKE_TESTSUITE
In-Reply-To: <20181209214348.31564-1-romain.naour@gmail.com>
References: <20181209214348.31564-1-romain.naour@gmail.com>
Message-ID: <20181210114830.54dd85b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 22:43:48 +0100, Romain Naour wrote:
> HOST_GCC_FAKE_TESTSUITE was removed since commit [1].
> 
> [1] 545ca6a0f2f4e0d8b3812949476ac2856264b83c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk     | 1 -
>  package/gcc/gcc-initial/gcc-initial.mk | 1 -
>  2 files changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
