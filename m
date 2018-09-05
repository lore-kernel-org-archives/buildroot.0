From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 4 Sep 2018 22:43:59 -0500
Subject: [Buildroot] [PATCH] package/xen: disable tools/qemu-xen/ opengl
In-Reply-To: <87r2i9asam.fsf@dell.be.48ers.dk>
References: <20180904191347.13857-1-matthew.weber@rockwellcollins.com>
 <87r2i9asam.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpaDnVs9tGEcHiM4c22tTH6wNQEE1S6spTxT-fbC6X1yvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
On Tue, Sep 4, 2018 at 4:04 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Resolves:
>  > http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320
>
>  > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Committed, thanks.
>
> It looks like we have a similar issue for qemu:
>
> http://autobuild.buildroot.net/results/827/827864f987cb5e82786e0a74be831aaad4d26610/build-end.log

I can't reproduce that one.  I tried on a Ubuntu 14 and 16 machine.

Matt
