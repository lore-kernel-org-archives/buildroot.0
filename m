From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Apr 2020 02:21:30 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-coherence: select pyasn1
 instead of pyasn
In-Reply-To: <20200419101835.303af37c@windsurf.home>
References: <20200413231704.124258-1-james.hilliard1@gmail.com>
 <20200419101835.303af37c@windsurf.home>
Message-ID: <CADvTj4r+2Vk+En2ChzexRakSoY_RXjKbNTMG1dHPS1K8p2tcfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 19, 2020 at 2:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 13 Apr 2020 17:17:04 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > The python-pyasn package is an outdated version of python-pyasn1 and
> > should not be used.
> >
> > We no longer need to depend on BR2_INSTALL_LIBSTDCPP as python-pyasn1
> > does not depend on it.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-coherence/Config.in | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
>
> Applied to master, thanks. I assume your plan is to get rid of
> python-pyasn and python-pyasn-modules now?
Yep, was just waiting on these to be merged first.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
