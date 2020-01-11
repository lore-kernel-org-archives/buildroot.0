From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:36:41 +0100
Subject: [Buildroot] [PATCH] package/glibc: add missing comment
In-Reply-To: <20200110223808.9070-1-romain.naour@gmail.com>
References: <20200110223808.9070-1-romain.naour@gmail.com>
Message-ID: <20200111153641.388d1658@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jan 2020 23:38:08 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Since [1], glibc package has a new option to install glibc utils to the
> target. But this option is displayed below "Kernel Header Options".
> 
> As for uClibc package, add a comment line to separate Glibc options
> from kernel header options.
> 
> [1] c6cd512fe2e954b2ccc0412717c1c3380bc5f69b
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/glibc/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
