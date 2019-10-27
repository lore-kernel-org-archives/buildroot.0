From: Matthew Weber <matthew.weber@collins.com>
Date: Sun, 27 Oct 2019 14:17:15 -0500
Subject: [Buildroot] [External] Re: [PATCH] toolchain: introduce config
 options to include GCC's sanitation libraries
In-Reply-To: <CAGt4E5sGLJXAbqD7=L+=A9w=EOGVmw6hc1-M1XFj7pY79DGUZA@mail.gmail.com>
References: <20190605214155.3006-1-mmayer@broadcom.com>
 <CAGt4E5udpTU+_+jige3NdgBt2C0w9A9tfG+5xOPDdxdyWL=R2A@mail.gmail.com>
 <CANQCQpYfibhMA9S_p6vrdLTmrUnURvaRrAxtK74naE7xiC==BQ@mail.gmail.com>
 <CAGt4E5sGLJXAbqD7=L+=A9w=EOGVmw6hc1-M1XFj7pY79DGUZA@mail.gmail.com>
Message-ID: <CANQCQpaO=2aHutk05AvpgHs-JQ8qYy9CYjsfwky1HZkUFjv43A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus,


On Sat, Oct 26, 2019 at 4:48 PM Markus Mayer <markus.mayer@broadcom.com> wrote:
>
> On Sat, 26 Oct 2019 at 12:03, Matthew Weber <matthew.weber@collins.com> wrote:
> >
> > Markus,
> >
> > On Sat, Oct 26, 2019 at 1:29 PM Markus Mayer <mmayer@broadcom.com> wrote:
> > >
> > > Hi all,
> > >
> > > On Wed, 5 Jun 2019 at 14:42, Markus Mayer <mmayer@broadcom.com> wrote:
> > > >
> > > > We add config options for external toolchains to allow copying the
> > > > following libraries into the root file system:
> > > >
> > > >   - libasan (-fsanitize=address)
> > > >   - liblsan (-fsanitize=leak)
> > > >   - libtsan (-fsanitize=thread)
> > > >   - libubsan (-fsanitize=undefined)
> > > >
> > > > Copying these shared libraries into the root file system will add
> > > > run-time support for binaries compiled with one of the above "sanitize"
> > > > options for enhanced run-time debugging.

I've extended then existing external toolchain additional libraries
hook via this patch.  It should apply to all toolchain types.
http://patchwork.ozlabs.org/patch/1185020/

Regards,
Matt
