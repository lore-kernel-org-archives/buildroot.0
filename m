From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 15:36:13 +0200
Subject: [Buildroot] using buildroot to statically build uclibc
In-Reply-To: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
References: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
Message-ID: <20150911153613.3950844c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doha Ehab,

On Fri, 11 Sep 2015 12:50:33 +0300, Doha Ehab wrote:

>  I am trying to statically build uclibc using buildroot to use it to cross
> compile mpich . when I generate uclibc toolchain using make menuconfig the
> executables in output/usr/host/bin are dynamically linked .
> do I have to build uclibc from output/build/toolchain folder in order to
> get the statically linked executables .
> I'm new to this if I'm missing something kindly direct me .

Are you sure you have enabled BR2_STATIC_LIBS=y ?

Which Buildroot version are you using ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
