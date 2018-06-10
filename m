From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:45:26 +0200
Subject: [Buildroot] [PATCH] docs/manual: always point to the correct
 license file
In-Reply-To: <20180602080101.23051-1-yann.morin.1998@free.fr>
References: <20180602080101.23051-1-yann.morin.1998@free.fr>
Message-ID: <20180610164526.39af76ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 10:01:01 +0200, Yann E. MORIN wrote:
> The manual is GPL-2, and points to the COPYING file in the repository.
> When we do a rendering of the manual for a specific version, that URL
> is currently always poitning to the latest version of the COPYING file.
> 
> If we ever have to change the content of that file (e.g. to add a new
> exception, more clarifications, a license change, or whatever), then
> an old manual would point to that newer version, which would then be
> incorrect.
> 
> Include the sha1 of the commit in the URL, so that the manual always
> point to the tree at the time the manual was rendered, not the time
> it is consulted. Contrary to the informative text above, use the full
> sha1, not the shortened one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  docs/manual/manual.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

To be honest, I am not sure how likely it is that the COPYING file ever
changes. The copyright is owned by all the authors of the project, so a
license change would be very difficult to do.

But anyway, since the change was there and is pretty simple, I've
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
