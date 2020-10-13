From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 17:35:53 +0200
Subject: [Buildroot] [PATCH] config/odroidc2: force host kernel version
 to 5.7
In-Reply-To: <20201010125648.10614-1-daggs@gmx.com>
References: <20201010125648.10614-1-daggs@gmx.com>
Message-ID: <20201013173553.7cf74688@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Oct 2020 15:56:48 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> as the current kernel version used for this board is 5.7,
> make sure that the host kernel version is the same to prevent
> build failure due to version miss match.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/779210973
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  configs/odroidc2_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
