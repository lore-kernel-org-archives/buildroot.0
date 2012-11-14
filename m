From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Nov 2012 16:24:56 +0100
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <CAAsE_ueNA-H3u2EHg0vMpEURR+u4+z8COmY-cY4ATyo_xpr1DA@mail.gmail.com>
References: <k7vnmj$27j$1@ger.gmane.org> <20121114153158.5de351df@skate>
 <201211141547.42502.yann.morin.1998@free.fr>
 <CAAsE_ucA-Gag0v-9g4AObY=yB4DZH7AEuvA3zkwGEvUPv5JgWA@mail.gmail.com>
 <20121114160302.50eb8ca8@skate>
 <CAAsE_ueNA-H3u2EHg0vMpEURR+u4+z8COmY-cY4ATyo_xpr1DA@mail.gmail.com>
Message-ID: <20121114162456.01d6258b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Wed, 14 Nov 2012 23:13:05 +0800, Woody Wu wrote:

> Yes, 3.6 has the ARM support.

The fact that is has ARM support does not mean that it will work on
your particular board, using a particular ARM SoC. For sure the S3C2410
is supported. You didn't tell us which board you're using, so there's
no way we can tell you.

> The one reason I feel hestitate to use 3.6 is
> that I am not sure 3.6 will results in a zImage too large thant that I
> could got with 2.6.  Do you have an experience in this? Thanks.

Depends on what configuration options you enable in the kernel, and how
small your zImage needs to be. Most likely on a S3C2410 based platform
you have enough flash space to handle a reasonably sized zImage.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
