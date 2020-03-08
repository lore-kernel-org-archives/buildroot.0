From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 8 Mar 2020 22:45:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
In-Reply-To: <CADvTj4rt9tkOfWej8z_CdPZSUgy=awfkR2OPAnJkJcqdGLuL6A@mail.gmail.com>
References: <20200308070741.42542-1-james.hilliard1@gmail.com>
 <20200308144746.6cbfbd8f@windsurf.home>
 <20200308173718.GA2885265@x230>
 <20200308223004.66fc1ca0@windsurf.home>
 <CADvTj4rt9tkOfWej8z_CdPZSUgy=awfkR2OPAnJkJcqdGLuL6A@mail.gmail.com>
Message-ID: <20200308214540.GA3301108@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > Then the "select BR2_PACKAGE_LIBMNL" added to
> > BR2_PACKAGE_CONNMAN_NFTABLES is completely unrelated to wireguard
> > support. connman needs libmnl if nftables is used *or* if wireguard is
> > used.

> > So the missing select BR2_PACKAGE_LIBMNL in
> > BR2_PACKAGE_CONNMAN_NFTABLES should be added as a separate patch.
> Sent here already: https://patchwork.ozlabs.org/patch/1251106/
James, thanks for your fix!
(add my Reviewed-by: tag to it).

Sorry for wrong patch.

Kind regards,
Petr
