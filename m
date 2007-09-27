From: don <don_reid@comcast.net>
Date: Thu, 27 Sep 2007 15:19:19 -0700
Subject: [Buildroot] Libtool error with AVR32
In-Reply-To: <1190926438.5322.16.camel@elrond.atmel.sweden>
References: <20070927181757.GA8519@reid1.localdomain>
	<1190926438.5322.16.camel@elrond.atmel.sweden>
Message-ID: <20070927221919.GA8983@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 27, 2007 at 10:53:58PM +0200, Ulf Samuelsson wrote:
> tor 2007-09-27 klockan 11:17 -0700 skrev don:
> > I tried to use the latest AVR32 release from ATmel and got an error.
> > Is there somewhere else to post that other than this list?
> > 
> > The error is in build_avr32_nofpu/libdaemon-0.12 and is:
> > ...
> > configure: WARNING: In the future, Autoconf will not detect cross-tools
> > whose name does not start with the host triplet.  If you think this
> > configuration is useful to you, please write to autoconf at gnu.org.
> > checking whether we are using the GNU Fortran 77 compiler... yes
> > checking whether gfortran accepts -g... yes
> > checking the maximum length of command line arguments... 98304
> > checking command to parse /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-nm output from /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-gcc -Os -pipe  -I/home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/include -msoft-float object... ok
> > checking for objdir... .libs
> > checking for avr32-linux-ar... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ar
> > checking for avr32-linux-ranlib... /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-ranlib
> > checking for avr32-linux-strip... (cached) /home/dev/AVR32/Buildroot/buildroot-avr32-2.1.0-rc5/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-strip
> > checking for correct ltmain.sh version... no
> > configure: error:
> > 
> 
> The general rule is that the main buildroot mailing list is for the 
> main buildroot trunk.
> The atmel AVR32 specific buildroot at www.atmel.no/buildroot,
> is, as documentation tells you, based on 2007-07-18.
> 
> Only a limited set of packages has seen testing in the Atmel trunk.
> If you use a package, not tested, then problem like this can occur.
> Your best alternative is likely to download the main trunk
> and copy the contents of package/<package> to the Atmel trunk.

I did not select any packages, just copied the ntgw100_defconfig to
.config.

-- 
Don
