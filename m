From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Aug 2013 20:52:08 +0200
Subject: [Buildroot] [PATCH 1/2] nios2: Add new architecture
In-Reply-To: <CAAEAJfA5m8b-xkRbzfw-Ukft2bxj0HD51BUZXKEg0Pi6yiUabg@mail.gmail.com>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145A9C.9040902@mind.be>
 <CAAEAJfA5m8b-xkRbzfw-Ukft2bxj0HD51BUZXKEg0Pi6yiUabg@mail.gmail.com>
Message-ID: <20130821205208.6b2155de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Wed, 21 Aug 2013 10:30:21 -0300, Ezequiel Garc?a wrote:
> On 21 August 2013 03:13, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 08/20/13 13:59, Ezequiel Garcia wrote:
> >>
> >> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >>
> >> This commit adds very basic support to build for the Nios II
> >> architecture. Toolchain support is still missing and instead
> >> we need to use an external custom toolchain.
> >
> >
> >  Then you probably want to exclude it from the buildroot toolchain.
> >
> 
> Ok, I'll take a look.

See toolchain/Config.in. You can add a !BR2_nios2 in both
BR2_TOOLCHAIN_BUILDROOT and BR2_TOOLCHAIN_CTNG.

> I want to support buildroot toolchain, but I'm not sure when I'll be able
> to do that.

You can do that later. Just exclude the internal and crosstool-ng
backends for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
