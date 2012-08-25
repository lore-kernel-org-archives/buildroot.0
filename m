From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 11:01:48 +0200
Subject: [Buildroot] [PATCH] syslinux: fix host build with newer Linux
 headers
In-Reply-To: <50388ADB.4090809@gmail.com>
References: <1345356100-23521-1-git-send-email-net147@gmail.com>
 <20120825101947.1479f89c@skate> <50388ADB.4090809@gmail.com>
Message-ID: <20120825110148.2754e699@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 25 Aug 2012 18:20:43 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> On 25/08/2012 6:19 PM, Thomas Petazzoni wrote:
> > Can you be more specific about which versions of the kernel headers 
> > are causing problems? I've just built syslinux with a 3.4 kernel 
> > headers based Buildroot toolchain, and it worked fine. Thanks! Thomas 
> 
> I am using Linux 3.5.1 headers on the host system building host-syslinux.

Hum, ok. Thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
