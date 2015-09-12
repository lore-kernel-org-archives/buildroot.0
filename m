From: Doha Ehab <dohaehab@gmail.com>
Date: Sat, 12 Sep 2015 12:57:04 +0300
Subject: [Buildroot] using buildroot to statically build uclibc
In-Reply-To: <20150911153613.3950844c@free-electrons.com>
References: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
 <20150911153613.3950844c@free-electrons.com>
Message-ID: <CAEjFr-acK7nF8D7FpV9sZyv46D+y8SSMCD3MQ+uQNaYuSzMtGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni ,
 I'm using buildroot-2015.02 and yes BR2_STATIC_LIBS  is enabled here is
the defconfig file :

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_GCC_ENABLE_OPENMP=y
BR2_ECLIPSE_REGISTER=y

Regards,
Doha

On Fri, Sep 11, 2015 at 4:36 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Doha Ehab,
>
> On Fri, 11 Sep 2015 12:50:33 +0300, Doha Ehab wrote:
>
> >  I am trying to statically build uclibc using buildroot to use it to
> cross
> > compile mpich . when I generate uclibc toolchain using make menuconfig
> the
> > executables in output/usr/host/bin are dynamically linked .
> > do I have to build uclibc from output/build/toolchain folder in order to
> > get the statically linked executables .
> > I'm new to this if I'm missing something kindly direct me .
>
> Are you sure you have enabled BR2_STATIC_LIBS=y ?
>
> Which Buildroot version are you using ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150912/62e54189/attachment.html>
