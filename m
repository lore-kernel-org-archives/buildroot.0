From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Apr 2020 11:39:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable nss-mymachines
 when machined is enabled
In-Reply-To: <20200412153801.2d176206@windsurf.home>
References: <20200308222711.75586-1-james.hilliard1@gmail.com>
 <20200412153801.2d176206@windsurf.home>
Message-ID: <CADvTj4popZwuHaL89n8x5iW=1UHH5sUhwa8ZMqDj7HYdaLLvoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 12, 2020 at 7:38 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun,  8 Mar 2020 16:27:11 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. For this one and the nss-resolve patch, does
> it make sense to tweak nssswitch.conf to enable those NSS modules when
> they are available ?
Hmm, does the systemd build system not do that by default already?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
