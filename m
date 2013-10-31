From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 31 Oct 2013 08:32:30 +0200
Subject: [Buildroot] Fwd:  ubuntu 13.10 prerequisites
In-Reply-To: <CALdGskJMhqCFkORg5zRf7rVWnt6irH5me=2utHOptA+221-03Q@mail.gmail.com>
References: <CALdGskJ6kQnW2GrRxoojk5Og_sOwrm9bmCOVX2nk7bkFp-nadw@mail.gmail.com>
 <20131030221459.474bc3eb@skate>
 <CALdGskJMhqCFkORg5zRf7rVWnt6irH5me=2utHOptA+221-03Q@mail.gmail.com>
Message-ID: <CALdGskJvKLuV_uhq+pHBS8QgUydnOe6NuZ=0ao7=ANjJBMVH-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

You are correct, only the libc:i386 is necessary to start a build. (If the
64-bit versions of gcc, binutils and g++ are installed)

The rest of the packages were added as the 32-bit counterparts buildroot
would need, if the 64-bit versions were not installed by default.

Sorry for the ambiguity

Regards

Olivier




On Wed, Oct 30, 2013 at 11:14 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Olivier Schonken,
>
> On Wed, 30 Oct 2013 22:44:05 +0200, Olivier Schonken wrote:
>
> > I installed ubuntu 13.10 after its release, a 64-bit version.  Before I
> > could get buildroot working, i had to install the 32-bit compatible libc,
> > gcc, g++ etc.
> > Apparently ubuntu 13.10 doesn't support ia32-libs any more.  Thus, you
> have
> > to manually install the required 32-bit packages as follows
>
> Hum, I am not sure why you would have to install the 32 bits version of
> those packages. Of course, if you use external toolchains that are
> compiled for 32 bits machine (most are), then you need libc:i386, but I
> don't see why you would need the other packages for 32 bits.
>
> Can you expand on the problems you had? Maybe I'm missing something
> obvious here.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131031/6c66747e/attachment.html>
