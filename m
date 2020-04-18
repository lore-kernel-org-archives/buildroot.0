From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 15:25:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/php: fix zip support
In-Reply-To: <20200418090343.140078-1-aussedat.louis@gmail.com>
References: <20200418090343.140078-1-aussedat.louis@gmail.com>
Message-ID: <20200418152552.347216fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Apr 2020 11:03:42 +0200
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> since php7.4, --enable-zip becomes --with-zip due to
> migration to pkg-config.
> 
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
