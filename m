From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 22:53:36 +0100
Subject: [Buildroot] [PATCH 0/2] update sunxi-boards and sunxi-tools for
 pcDuino board
In-Reply-To: <1386721499.2817.17.camel@kokopelli>
References: <1386721499.2817.17.camel@kokopelli>
Message-ID: <20131211225336.489ff1cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brian Beattie,

On Tue, 10 Dec 2013 16:24:59 -0800, Brian Beattie wrote:
> In preparation for adding support for for the pcduino board, update the
> sunxi-boards and sunxi-tools to the commit recommended for pcduino.
> 
> These packages are also used by the Cubieboard so if somebody with a
> Cubieboard could test this that would be good.
> 
> Brian Beattie (2):
>   update sunxi-boards to newer commit as recomended for pcDuino board
>   update sunxi-boards to newer commit as recomended for pcDuino board

Thanks for your patches! They look good, except for a few minor things:

 * Their title should be something like:

    <package name>: <what is happening to them>

   so typically:

    sunxi-boards: bump version, to support the pcDuino board
    sunxi-tools: bump version, to support the pcDuino board

 * The title of your second patch was wrong: it bumps the version of
   sunxi-tools, not sunxi-boards.

 * You should sent your patches with 'git send-email'. You've sent them
   with Evolution, but Evolution has line-wrapped the patches, which
   prevents them from being applied. Also, it will ensure that your
   patches are sent as replies to your cover letter, all automatically.

 * Your patches should have a Signed-off-by line.

See
http://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
for more details.

Could you resend a version 2 of your patch series with these minor
issues fixed?

Also, since you're using the pcDuino board, could you submit a simple
defconfig that builds a minimal system for this platform (i.e toolchain
+ bootloader + kernel + minimal rootfs) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
