From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 09:06:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <1873592662.2762704.1523500837920.JavaMail.zimbra@datacom.ind.br>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <147906727.2330850.1523328627127.JavaMail.zimbra@datacom.ind.br>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
 <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
 <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
 <345647775.2610070.1523450364355.JavaMail.zimbra@datacom.ind.br>
 <20180411151910.21a71a99@windsurf>
 <1873592662.2762704.1523500837920.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180412090641.0bda08c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Apr 2018 23:40:37 -0300 (BRT), Carlos Santos wrote:

> > Is this problem really PowerPC specific ? Did you try other gcc 4.7
> > toolchains for other architectures ?  
> 
> I will try to find a museum from which I can get such toolchains.

Old Sourcery toolchains can typically be used for that, and
http://sources.buildroot.net/ is a good museum to find them. For
example:

http://sources.buildroot.net/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
http://sources.buildroot.net/arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
http://sources.buildroot.net/arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
http://sources.buildroot.net/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
etc.

> > Also, adding new dependencies on libglib2 is an absolute nightmare: you
> > have to propagate those new dependencies to gazillions of packages (all
> > reverse dependencies of libglib2) :-/  
> 
> Indeed it is. :-(

Hence we should try to avoid this if possible :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
