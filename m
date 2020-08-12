From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 12 Aug 2020 06:01:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: drop wrong
 linux-headers dependency
In-Reply-To: <20200811223740.2473421-1-fontaine.fabrice@gmail.com>
References: <20200811223740.2473421-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812040144.GA125203@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Commit 9ffcd9279e5505535a73cf1200b3a86fd425cf32 wrongly added a
> linux-headers dependency when switching to meson.

> Remove it as headers are always provided by the toolchain.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thanks!
Acked-by: Petr Vorel <petr.vorel@gmail.com>

BTW next release (which should be soon) will not depend on any crypto library
(md5 implementation is included).

Kind regards,
Petr
