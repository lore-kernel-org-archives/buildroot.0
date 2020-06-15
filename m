From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Jun 2020 20:09:10 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration
 file
In-Reply-To: <20200615072247.GR2346@scaer>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-2-ps.report@gmx.net>
 <20200614095628.GJ2346@scaer> <20200614210740.0d39d95d@gmx.net>
 <20200614205715.GN2346@scaer> <20200614232826.146a5b79@gmx.net>
 <20200614213610.GQ2346@scaer> <20200614234827.2208bc3a@gmx.net>
 <20200615072247.GR2346@scaer>
Message-ID: <20200615200910.6098e90c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, 15 Jun 2020 09:22:47 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2020-06-14 23:48 +0200, Peter Seiderer spake thusly:
> > On Sun, 14 Jun 2020 23:36:10 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2020-06-14 23:28 +0200, Peter Seiderer spake thusly:
> [--SNIP--]
> > > > And what is about the LIBFOO_INSTALL_INIT_OPENRC mentioned in [1]?
> > > Aha! If not specified, it defaults to using the sysv hook, quoting:
> > >     The only exception is when openrc is chosen as init system and
> > >     LIBFOO_INSTALL_INIT_OPENRC has not been set, in such situation
> > >     LIBFOO_INSTALL_INIT_SYSV will be called, since openrc supports
> > >     sysv init scripts.
> > So, what do with the openrc-init case (for the config file)?
>
> In the openrc case, you'd get to use openresolv, so the config file
> would be the same as for the sysv case. And since you are adding a
> startup script for sysv (in the followup patch), it will also be used
> for the openrc case.

But in case of LIBFOO_INSTALL_INIT_OPENRC no (additional) entry will be
written to the config file...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
