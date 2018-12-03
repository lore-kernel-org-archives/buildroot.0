From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:29:39 +0100
Subject: [Buildroot] [PATCH 1/2] atk: remove unrecognized configure
 options
In-Reply-To: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
References: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203132939.23ced7b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 08:30:42 +0100, Fabrice Fontaine wrote:
> Remove --disable-glibtest and --enable-explicit-deps, these options are
> not recognized:
> configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-glibtest, --enable-explicit-deps
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/atk/atk.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
