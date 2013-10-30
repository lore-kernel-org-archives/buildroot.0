From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:14:59 +0100
Subject: [Buildroot] ubuntu 13.10 prerequisites
In-Reply-To: <CALdGskJ6kQnW2GrRxoojk5Og_sOwrm9bmCOVX2nk7bkFp-nadw@mail.gmail.com>
References: <CALdGskJ6kQnW2GrRxoojk5Og_sOwrm9bmCOVX2nk7bkFp-nadw@mail.gmail.com>
Message-ID: <20131030221459.474bc3eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Wed, 30 Oct 2013 22:44:05 +0200, Olivier Schonken wrote:

> I installed ubuntu 13.10 after its release, a 64-bit version.  Before I
> could get buildroot working, i had to install the 32-bit compatible libc,
> gcc, g++ etc.
> Apparently ubuntu 13.10 doesn't support ia32-libs any more.  Thus, you have
> to manually install the required 32-bit packages as follows

Hum, I am not sure why you would have to install the 32 bits version of
those packages. Of course, if you use external toolchains that are
compiled for 32 bits machine (most are), then you need libc:i386, but I
don't see why you would need the other packages for 32 bits.

Can you expand on the problems you had? Maybe I'm missing something
obvious here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
