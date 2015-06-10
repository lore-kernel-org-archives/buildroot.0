From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 10:39:09 +0200
Subject: [Buildroot] Kernel zImage under 1MB
In-Reply-To: <87lhfsj7ro.fsf@dell.be.48ers.dk>
References: <CADMiy=KWH-W4VGUjaMF8mmFTSRUxT13xbTeoWigo=gme8GDwKw@mail.gmail.com>
 <87pp54jzw1.fsf@dell.be.48ers.dk>
 <CADMiy=JZSro09MASQy51wKeDy2uES0D-kWwNgtL95s6z1AmxrA@mail.gmail.com>
 <87lhfsj7ro.fsf@dell.be.48ers.dk>
Message-ID: <20150610103909.59514ae1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jun 2015 10:18:51 +0200, Peter Korsgaard wrote:

>  > As a question aside, Is it enough just
>  > "make manuconfig" and "make" rebuild the kernel and rootfs or do i need to
> 
> Buildroot doesn't track changes in the configuration file / what files
> were added by a package, so it will not remove a package if you do a
> build and then use menuconfig to remove the package again.
> 
> It WILL rebuild the kernel or busybox after you used make
> linux-menuconfig or make busybox-menuconfig to tweak the configuration.

See also:

 http://buildroot.org/downloads/manual/manual.html#full-rebuild

for more details.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
