From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Sep 2018 16:27:17 -0500
Subject: [Buildroot] [PATCH] package/xen: disable tools/qemu-xen/ opengl
In-Reply-To: <CANQCQpaDnVs9tGEcHiM4c22tTH6wNQEE1S6spTxT-fbC6X1yvw@mail.gmail.com>
References: <20180904191347.13857-1-matthew.weber@rockwellcollins.com>
 <87r2i9asam.fsf@dell.be.48ers.dk>
 <CANQCQpaDnVs9tGEcHiM4c22tTH6wNQEE1S6spTxT-fbC6X1yvw@mail.gmail.com>
Message-ID: <CANQCQpaCg0z1vcTXOrsiHQEZ0dQc5V70ixz8fQuoYymVRam1tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Tue, Sep 4, 2018 at 10:43 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Peter,
> On Tue, Sep 4, 2018 at 4:04 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> >
> > >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
> >
> >  > Resolves:
> >  > http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320
> >
> >  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >
> > Committed, thanks.
> >
> > It looks like we have a similar issue for qemu:
> >
> > http://autobuild.buildroot.net/results/827/827864f987cb5e82786e0a74be831aaad4d26610/build-end.log
>
> I can't reproduce that one.  I tried on a Ubuntu 14 and 16 machine.
>

Would you mind checking on your builder?
