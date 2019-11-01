From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 1 Nov 2019 11:56:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix NPTL dependency
In-Reply-To: <20191101114121.7fcee7a4@windsurf.home>
References: <20191101055320.16078-1-heiko.thiery@gmail.com>
 <20191101114121.7fcee7a4@windsurf.home>
Message-ID: <CAPi7W81HvW+rncF-4t8aQ6wxpc6iL1U5JyQ=a8HycR6iWdqyUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le ven. 1 nov. 2019 ? 11:41, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Fri,  1 Nov 2019 06:53:20 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > From: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > Dependency is BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of
> > !BR2_TOOLCHAIN_HAS_NPTL.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> > ---
> >  package/sysrepo/Config.in | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. I should have spotted that when reviewing :-/
I shouldn't have made the mistake, sorry about that.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
