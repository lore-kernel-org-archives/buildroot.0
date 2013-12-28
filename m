From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 12:42:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-27
In-Reply-To: <20131228102610.GA3373@free.fr>
References: <20131228073009.0C3D910103D@stock.ovh.net>
 <20131228102610.GA3373@free.fr>
Message-ID: <20131228124239.5832b6d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 11:26:10 +0100, Yann E. MORIN wrote:

> On 2013-12-28 08:30 +0100, Thomas Petazzoni spake thusly:
> > Detail of failures
> >    powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/c21fdc2b4e6564e4d557380e5e86aba0d78f1364/
> 
> Too old kernel headers, should be fixed by an exception on the
> autobuilders.

I added the exception to the autobuilders yesterday.

> >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1f5c0689ae129ae5fa30f31a4f47ccbd7705ff00/
> >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/1729043d9c977a59a4fdd7ccd3d16cfc8aef7678/
> >    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/3ab080e96576e0012fea853009811247338e665e/
> 
> Can not find python-argparse. I'll check this.

Maybe just disable Python support in libevdev or something like that.

> >    powerpc | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/a1653834d24cecc5e3bd1aded78811b794126963/
> >    powerpc | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/c99120ec2f33d7d05dfb4b4a5338e0a4ce1d9d4c/
> >        arm | make: *** [snmppp-legal-inf... | NOK | http://autobuild.buildroot.net/results/e64c3edcb00132620b07ad815c6e4d33b70c262f/
> 
> Should be fixed by:
>     006e9d6: snmppp: fix legal informations after version bump

Indeed.

> >     x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/7c6aae3a50e50962db02b63306f47bee755b1b1f/
> >     x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/54deb02959e1c011c3971b23f409f47c285a88e4/
> >    powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/4d3d5129fce43647f781223e223ca22cd348e1b5/
> 
> Still "can't find python-protobuf".

Yes, need to finish the investigation for that one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
