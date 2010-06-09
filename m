From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jun 2010 08:31:42 +0200
Subject: [Buildroot] [PATCH] skeleton: remove loopback interface
 configuration from inittab
In-Reply-To: <20100609015835.GD2318@tarshish>
References: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
	<20100607092312.7e736feb@surf> <20100609015835.GD2318@tarshish>
Message-ID: <20100609083142.0524d5a6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 9 Jun 2010 04:58:35 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > > The lo interface is marked auto in /etc/network/interfaces, so the
> > > configuration of the loopback network interface is part of the
> > > S40network init script. This causes the "RTNETLINK answers: File
> > > exists" error message to appear at startup time.
> > 
> > Not tested, but I think it's ok.
> > 
> > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Thanks.
> 
> Any chance of this being accepted upstream?

Yes. Just wait for Peter (Buildroot's maintainer) to pick up your
patch. It may take a few days for this to happen. If we haven't merged
your patch in one week from now, then ping us again.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
