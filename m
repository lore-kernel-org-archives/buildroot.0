From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Feb 2011 23:21:19 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
Message-ID: <20110221232119.07dc234d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Feb 2011 21:53:51 +0100
Zden?k Materna <zdenek.materna@gmail.com> wrote:

> I have problem with init. Kernel boots ok, but after message "Freeing init
> memory: 120K" there is no response (*), but system seems to be up (it
> responds to ping). I tried to change init=/linuxrc to init=/hello which is
> statically compiled hello world and after that I got kernel panic (**). I
> double checked all configuration, but I couldn't find nothing weird. I have
> Generic serial port configured and console is also configured in inittab.
> All is compiled with same toolchain with EABI. Where might be problem?
> Thanks for any advice.
> 
> My kernel command line: mem=64M console=ttyS0,115200 root=/dev/nfs rw
> nfsroot=192.168.1.37:/home/zdenal/nfsroot/,proto=tcp ip=dhcp init=/linuxrc.
> 
> Buildroot from git, kernel 2.6.33.7, uClibc 0.9.31, Busybox 1.18.

Could you post your Buildroot .config and kernel .config files, and the
full kernel boot log ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
