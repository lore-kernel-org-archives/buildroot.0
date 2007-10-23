From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 24 Oct 2007 00:59:16 +0200
Subject: [Buildroot] Busybox minicom-like application?
In-Reply-To: <20071023224556.GA18766@cloud.net.au>
References: <6090c5eb0710231132k5146e947r48e3deeedc4b7599@mail.gmail.com>
	<471E5044.7020003@promwad.com>
	<6090c5eb0710231152r5cc500begf381537fad9efa0b@mail.gmail.com>
	<471E53BA.5060401@promwad.com>  <20071023224556.GA18766@cloud.net.au>
Message-ID: <1193180356.5708.1.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-10-24 klockan 08:45 +1000 skrev Hamish Moffatt:
> Jorge S. wrote:
> > Yes, i know its there, but it gets HIDDEN when i select the "[*] Hide
> > applications that are provided by busybox".
> > 
> > Maybe there's a buildroot bug here?
> 
> busybox in SVN does have a microcom applet, as of four weeks ago. The
> latest change to package/Config.in takes that into account.
> 
> On Tue, Oct 23, 2007 at 11:04:10PM +0300, Ivan Kuten wrote:
> > Indeed,
> > 
> > see Config.in
> > 
> > if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
> > source "package/microcom/Config.in"
> > endif
> > 

I do not think that is a good idea to hide it until
it is in the mainstream busybox.

-- 
Best Regards,
Ulf Samuelsson
