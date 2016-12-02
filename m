From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:57:42 +0100
Subject: [Buildroot] [PATCH 03/10] docs/manual: document the waf-package
 infra
In-Reply-To: <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161202235742.41906f95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:14 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>

Applied with a few tweaks, see below.

> +10: LIBFOO_CONF_OPTS = --eanble-bar --disable-baz

Typo fixed.

> +* +LIBFOO_BUNDLED_WAF+ can be set to +YES+ or +NO+ to tell Buildroot to
> +  use the bundled +waf+ executable. If set to +YES+, the default, then
> +  Buildroot will use the waf executable in the package source tree; if
> +  set to +NO+, then Buidlroot will download and install waf as a
> +  host-tool.

I've obviously reworded this paragraph quite a bit to take into account
the new name of the variable, LIBFOO_NEEDS_EXTERNAL_WAF.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
