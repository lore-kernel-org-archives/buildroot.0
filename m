From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Feb 2018 11:52:10 +1030
Subject: [Buildroot] [PATCH] gcc: or1k: use 20170218 tag instead of
 branch
In-Reply-To: <87372fwwok.fsf@dell.be.48ers.dk>
References: <20180203201821.3924-1-peter@korsgaard.com>
 <CACPK8XfD4dHS4QMDr_HdgLSoHT+PX-zJ5wxXbsjL-hN2pzDpuA@mail.gmail.com>
 <20180205093609.GG30895@lianli.shorne-pla.net>
 <87372fwwok.fsf@dell.be.48ers.dk>
Message-ID: <CACPK8Xcc4u8LuD2s+cA6oKgyUFLWDdE98MyAfK5G_gwJJTzz1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 5, 2018 at 9:05 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Stafford" == Stafford Horne <shorne@gmail.com> writes:

>
>  > I have been working on updating the GCC port to 7.2.0 with binutils 2.29, its in
>  > my forks right now:
>
>  >   https://github.com/stffrdhrn/binutils-gdb/tree/or1k-2.29
>  >   https://github.com/stffrdhrn/or1k-gcc/tree/or1k-7.2.0-20180112
>
>  > With 7.x we no longer need a separate branch/tag for musl.
>
> Ok, that's nice!
>
>  > I dont know too much about the buildroot build, but let me know if you need me
>  > to do anything on the openrisc github repo to make it better.

Good to know the toolchains are moving forward. I assume you have a
plan to formally release the newer versions at some point?

Let us know when you do, and I will be happy to help integrate them in
to Buildroot.

Cheers,

Joel
