From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 15 Nov 2013 08:58:01 +0000
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20131114101018.4c10ea52@skate>
References: <20131113223646.66a7a61b@skate>
 <CAHt8ZCOb3Vy4JLpbP88hK7o9t2CfT8_V=_ytfx2_E1uko+UL4g@mail.gmail.com>
 <20131114101018.4c10ea52@skate>
Message-ID: <CAHt8ZCNMeLP6dhZevb=y21PYQ2tWwvceF0dVvdH_8BGq2SkTtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 14 November 2013 09:10, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Well, the difference between all of these builds and the AVR32 one is
> obviously that AVR32 is using uClibc 0.9.31, right? Seems like uClibc
> 0.9.33 is not affected by the problem. So I would suggest that a fix is
> made to uClibc 0.9.31 to avoid this problem.
>
> Maybe it's just
> uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
> from our 0.9.33.2 patch stack that needs to be backported to uClibc
> 0.9.31 ?

Okay; thanks for the tip. I'll submit a patch for this.

Simon.
