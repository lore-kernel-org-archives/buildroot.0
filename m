From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:40:14 +0200
Subject: [Buildroot] [RFC 1/1] package/[wpe]webkit[gtk]: common config
 BR2_PACKAGE_WEBKIT_ARCH_SUPPORT[_JIT]
In-Reply-To: <20190330101940.25868-2-francois.perrad@gadz.org>
References: <20190330101940.25868-1-francois.perrad@gadz.org>
 <20190330101940.25868-2-francois.perrad@gadz.org>
Message-ID: <20190413224014.7966e180@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sat, 30 Mar 2019 11:19:40 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/midori/Config.in       |  4 ++--
>  package/webkitgtk/Config.in    |  8 ++++----
>  package/webkitgtk/webkitgtk.mk |  2 +-
>  package/wpewebkit/Config.in    | 36 +++-------------------------------
>  package/wpewebkit/wpewebkit.mk |  2 +-
>  5 files changed, 11 insertions(+), 41 deletions(-)

Thanks for this alternate proposal, but after discussing with Yann and
Arnout on IRC, the three of us agreed that we didn't like seeing one
package defining options that don't match this package name, and then
have those options re-used by another package.

We are also not entirely convinced by Adrian's proposal either. Arnout
is going to reply separately about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
