From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 09:11:01 +0100
Subject: [Buildroot] [PATCH] package/googlefontdirectory: better
 solution to avoid check-package warning
In-Reply-To: <20190210154815.25334-1-yann.morin.1998@free.fr>
References: <20190210154815.25334-1-yann.morin.1998@free.fr>
Message-ID: <20190211091101.6f6ce335@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Feb 2019 16:48:15 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Rather than tell check-package to ignore a false-positive issue, just
> avoid the issue to begin with, by using an intermediate variable to
> construct the list of licenses.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/googlefontdirectory/googlefontdirectory.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
