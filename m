From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 18 Jul 2016 08:50:51 +0000
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <20160718104900.77748f2a@free-electrons.com>
References: <1468831359.3068.19.camel@synopsys.com>
 <20160718104900.77748f2a@free-electrons.com>
Message-ID: <1468831770.3068.21.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-07-18 at 10:49 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 18 Jul 2016 08:44:00 +0000, Alexey Brodkin wrote:
> 
> > 
> > I'm wondering if there's a way to access Buildroot main git repo via HTTPS?
> > Here (https://git.busybox.net/buildroot/) it is mentioned only git protocol URL:
> > git://git.busybox.net/buildroot which doesn't work behind some corporate firewalls
> > (and I'm tired asking IT guys to open git port for each particular server IP).
> > 
> > IMHO HTTPS option would be very convenient especially keeping in mind very few
> > people have rights to commit.
> It would indeed be useful. But in the mean time, you can already get
> Buildroot from https://, by using the Github mirror at
> https://github.com/buildroot/buildroot/.

Indeed that's what I did but from purist POV true mainline git repo
is a little-bit better solution :)

-Alexey
