From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2011 11:52:17 +0200
Subject: [Buildroot] Questions related to "Incorrect selection of the C
 library" error
In-Reply-To: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
References: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
Message-ID: <20110914115217.5a64e8d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Sep 2011 10:16:19 +0200,
stl <st.lambert02@gmail.com> a ?crit :

> I am trying to port Buildroot for a new architecture and I am facing
> the following error when I build it:
> 
> Checking external toolchain settings
> Incorrect selection of the C library
> 
> The following lib (ld*-uClibc.so.*) is missing in my /lib/ dir.
> Where does this lib come from?

From the external toolchain.

> In my .config, I have selected BR2_TOOLCHAIN_EXTERNAL=y
> and I have set the path for my toolchain, and the prefix.
> 
> But where can I set the path for my installed uClibc directory?
> ( /usr/<arch>-linux-uclibc )

In the toolchain menu:
 * Select "External toolchain" as Toolchain type
 * Select "Custom toolchain" as Toolchain
 * Put the path of your toolchain in Toolchain path

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
