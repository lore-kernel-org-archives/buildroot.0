From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 20 Aug 2018 11:09:23 -0500
Subject: [Buildroot] uboot-tools autobuilder failure
In-Reply-To: <20180820160226.gr4enwblhv3g5ds2@sapphire.tkos.co.il>
References: <CANQCQpYFZMAwUs=moym1oc4GCjH6C8AHbDpOueL0r3+c3==BJw@mail.gmail.com>
 <20180820160226.gr4enwblhv3g5ds2@sapphire.tkos.co.il>
Message-ID: <CANQCQpYXTK-LX+L9NU_qmwP7kyxG=wcEJeQC1LReYiMTCpoO1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Mon, Aug 20, 2018 at 11:02 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Matt,
>
> On Mon, Aug 20, 2018 at 10:57:54AM -0500, Matthew Weber wrote:
> > Hollis, I don't have a machine old enough to debug this failure.
> > What's weird is the target uboot-tools is being built with a GCC6/7
> > which should support -std=gnu11, however we get a cc1: error:
> > unrecognized command line option "-std=gnu11".
> >
> > http://autobuild.buildroot.net/?reason=uboot-tools-2018.07
>
> These failures should be fixed in master by commit 03a808a099 (uboot-tools:
> force host CFLAGS).
>

Thanks!  I now notice that the master branch hasn't failed since the
patch was applied on Aug 10th.  So we're good.

Matt
