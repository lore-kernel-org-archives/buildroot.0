From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Mar 2013 09:25:27 +0100
Subject: [Buildroot] [git commit] package/connman: bump version to 1.11
In-Reply-To: <201303210016.46336.yann.morin.1998@free.fr>
References: <20130301101142.D5D809ADCE@busybox.osuosl.org>
 <20130320222341.5e947d69@skate>
 <201303202358.23129.yann.morin.1998@free.fr>
 <201303210016.46336.yann.morin.1998@free.fr>
Message-ID: <20130321092527.3ae1e3e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 21 Mar 2013 00:16:46 +0100, Yann E. MORIN wrote:
> > So, it seems the UAPI split-up broke a few things... :-(
> > 
> > I'll dig to see if the upstreams have a fix (either as a new release, or
> > as a commit in their trees).
> 
> bridge-utils has not (yet?) been released with a fix, but it has been
> committed in their tree with a very explicit commit message:
>     https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/commit/?id=5eebb7f9288b7881ffb929b1fd494fe3ac3be27d
> 
> I'll see to apply a similar fix to connman later in the week.

Great, thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
