From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 21:19:47 +0100
Subject: [Buildroot] [PATCH 0/24 v3] ejabberd: XMPP server (branch
 yem/ejabberd)
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <20141122211947.2d556071@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Johan,

On Wed, 12 Nov 2014 01:26:05 +0100, Yann E. MORIN wrote:

> ----------------------------------------------------------------
> Johan Oudinet (14):
>       package/pkg-rebar: new infrastructure
>       erlang-goldrush: new package.
>       erlang-lager: new package.
>       erlang-p1-zlib: new package.
>       erlang-p1-yaml: new package.
>       erlang-p1-xml: new package.
>       erlang-p1-utils: new package.
>       erlang-p1-tls: new package.
>       erlang-p1-stun: new package.
>       erlang-p1-stringprep: new package.
>       erlang-p1-sip: new package.
>       erlang-p1-iconv: new package.
>       erlang-p1-cache-tab: new package.
>       ejabberd: new package.
> 
> Yann E. MORIN (10):
>       pkg-autotools: move common macros
>       pkg-autotools: re-order cleaning up the host dependencies
>       pkg-autotools: commonalise the libtool patching code
>       pkg-autotools: move the libtool patching call out of the autoreconf hook
>       pkg-autotools: remove redundant shell conditional
>       pkg-autotools: fold the libtool patching code directly into the hook
>       pkg-autotools: only apply libtool patch at the right moment

I've applied all the pkg-autotools patches of this series. As discussed
on IRC, I've changed back the authorship of patches 1, 3, 4 to Johan,
who is actually the author of those patches.

I haven't yet looked at the rest of the series, but at least it's 7
less patches for you to carry in your branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
