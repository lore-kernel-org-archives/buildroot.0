From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 14:12:14 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/wine: Add gettext dependency
 for host-wine only with NLS enabled
In-Reply-To: <20190105200046.31512-2-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
 <20190105200046.31512-2-vadim4j@gmail.com>
Message-ID: <20190206141214.6bbf5843@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Jan 2019 22:00:44 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Checked that host-wine compiles ok without host-gettext, so no
> needs to specify this dependency.
> 
> libgettextpo is required by tools/wrc (https://linux.die.net/man/1/wrc)
> which allows to convert windows resources also to *.po format, which is
> not needed if NLS is disabled.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/wine/wine.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
