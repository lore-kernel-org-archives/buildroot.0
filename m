From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Aug 2013 11:10:26 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <CAAXf6LUogmYufmPM9xDf4VjiNV_N_Vg+kuXvzL2ky7Pp0dcJHw@mail.gmail.com>
References: <20130731191415.545f7dff@skate>
 <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
 <20130801182311.6bb6e57e@skate>
 <CAHXCMMJacpBKoSpKH8NRtDyto92ZZ6AA2bh2jFyOZx4L00cxFw@mail.gmail.com>
 <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
 <20130802105007.6957b0da@skate>
 <CAAXf6LUogmYufmPM9xDf4VjiNV_N_Vg+kuXvzL2ky7Pp0dcJHw@mail.gmail.com>
Message-ID: <20130802111026.4ebc403f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 2 Aug 2013 11:09:11 +0200, Thomas De Schampheleire wrote:

> > So the intention is really to have 'make foo-rebuild' do that 'make &&
> > make install' for the user, for the package <foo>.
> 
> As said, I don't have a problem with the existing
> reconfigure-does-it-all approach.
> I may have misunderstood the objections of others: there is no
> objection against reconfigure doing also rebuild, only that
> reconfigure and rebuild also make the rootfs?

That's my understanding of what the objections are, yes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
