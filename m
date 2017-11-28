From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Nov 2017 14:04:19 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-27
In-Reply-To: <20171128135921.0e2cdb53@windsurf.home>
References: <20171128070012.4EDDD20746@mail.free-electrons.com>
 <20171128110825.GE2889@scaer>
 <20171128135921.0e2cdb53@windsurf.home>
Message-ID: <20171128130419.GF2889@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2017-11-28 13:59 +0100, Thomas Petazzoni spake thusly:
> On Tue, 28 Nov 2017 12:08:25 +0100, Yann E. MORIN wrote:
> > On 2017-11-28 08:00 +0100, Thomas Petazzoni spake thusly:
> > > Results for branch 'next'
> > >      aarch64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/1e974c814ae4236077a869339be1143a9af7e5cd | ORPH
> > >       x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/1b4b37381d78e41dcf87e3494181cfdacb452d8e | ORPH
> > >       x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/0256f5be80314b00c02881ce7aa1dec35c8afc83 | ORPH
> > >          arm |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/17044c2d88c291265daeb9302af8b8f1ac56aae9 | ORPH
> > >       x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/5721634ffa2a4544a82dda08c1fcea331ecdadaf | ORPH
> > >       x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca | ORPH  
> > 
> > For python support, avahi now requires python-gobject >= 3.0, but:
> > 
> >   - we only have python-gobject 2.28;
> > 
> >   - we do not enforce the dependency anyway.
> > 
> > Bernd, you bumped avahi. Would you care fixing this, please?
> 
> Bernd already submitted a patch to fix this:
> http://lists.busybox.net/pipermail/buildroot/2017-November/208063.html.
> Unfortunately, it was never recorded in patchwork :-/

Ah, that's why I did not see it.

I'll reply to that patch, then. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
