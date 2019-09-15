From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 15 Sep 2019 09:46:01 -0300
Subject: [Buildroot] [PATCH v2 2/2] package/thttpd: fix init script
In-Reply-To: <20190915144017.47b1ee79@windsurf.home>
References: <20190915000657.10570-1-unixmania@gmail.com>
 <20190915144017.47b1ee79@windsurf.home>
Message-ID: <CAJ4jsac2fNCBENNF1j8e1XrHv80zJ1ppB5cdQkeiyonQ8a2NsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 15, 2019 at 9:40 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 14 Sep 2019 21:06:57 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > The init script provided by thttpd is for FreeBSD. Add a custom one,
> > made specifically for Buildroot.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> > Changes v1->v2:
> > - Fix commit message spell errors (maade, Buirdroot).
> > ---
> >  package/thttpd/S90thttpd | 54 ++++++++++++++++++++++++++++++++++++++++
> >  package/thttpd/thttpd.mk |  4 +--
> >  2 files changed, 56 insertions(+), 2 deletions(-)
> >  create mode 100644 package/thttpd/S90thttpd
>
> Applied to master, thanks.
>
> Thomas

Notice that the script requires /etc/thttpd.conf, introduced in a
previous patch:

    https://patchwork.ozlabs.org/patch/1154138/

-- 
Carlos Santos <unixmania@gmail.com>
