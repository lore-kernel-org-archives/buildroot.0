From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:51:44 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: PAGER without blank and unset
 at end of for loop
In-Reply-To: <20180605134745.24435-1-F.LaRoche@pilz.de>
References: <20180605134745.24435-1-F.LaRoche@pilz.de>
Message-ID: <20180605185144.242770c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 15:47:45 +0200, Florian La Roche wrote:
> The PAGER environment variable is including a blank character at the
> end. Remove this.
> A for loop has been unsetting the variable inside the loop, this is only
> needed once at the end of the loop.
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  system/skeleton/etc/profile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
