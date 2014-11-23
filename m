From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:26:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
Message-ID: <20141123182619.23fbfdba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 23 Nov 2014 18:24:02 +0100, Samuel Martin wrote:

> Nginx failure root cause seems to be a kernel with no sysctl syscall.
> This seems to happen only on arc.
> 
> Anton, Alexey, is it intended that CONFIG_SYSCTL_SYSCALL is disabled
> in the arc kernel config?

Yes, see
http://lists.busybox.net/pipermail/buildroot/2014-November/112629.html.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
