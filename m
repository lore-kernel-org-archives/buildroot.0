From: manu f <e.fiancette@gmail.com>
Date: Sun, 24 Jan 2021 12:40:31 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <20210123114813.0f7048c2@windsurf.home>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
 <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
 <20210123114813.0f7048c2@windsurf.home>
Message-ID: <CAGshWo2ngucacs+BJocUb36G4QX7Q7ssv2_M0R9kAiV+oick1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

here my complete .config

Le sam. 23 janv. 2021 ? 11:48, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Fri, 22 Jan 2021 23:53:30 +0100
> manu f <e.fiancette@gmail.com> wrote:
>
> > ok, I remove libevdev in Target package =>libraries=>Other and its copile
> > without error!
> >
> > (But I dont know if I realy need this lib... )
> >
> > Well why it no compile with libdevdev ?
> > @ Thomas Petazzoni I saw you already got problem and make patch for
> > host-python interpreter...is there something to see with ?
>
> host-python is definitely part of Buildroot 2020.02, so I'm not sure
> how you can get this error. We would need more details, such as the
> complete .config that reproduces the issue.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210124/1682bb37/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 130473 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210124/1682bb37/attachment-0001.obj>
