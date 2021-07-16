From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:28:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcr: fix introspection option
In-Reply-To: <20210714213115.2959939-1-fontaine.fabrice@gmail.com>
References: <20210714213115.2959939-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716232851.725eb1a1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 14 Jul 2021 23:31:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> introspection option was wrongly named --with-introspection instead of
> --enable-introspection since commit
> d4e7c720aa78dbe659db82f4eb38ff58ebae4c57:
> 
> configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-introspection
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gcr/gcr.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
