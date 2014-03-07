From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:30:03 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAHkwnC9Yx_uQqZQwiqmExJgErg_tey0n7dm5cZYWLp2sG_HsPw@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
 <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
 <20140307214651.1cb85457@skate>
 <CAHkwnC-g36dQ0OzSkqZdrWbjkwe3izYqpF+e81gff-ezA35H6g@mail.gmail.com>
 <20140307215801.69039f22@skate>
 <CAHkwnC9Yx_uQqZQwiqmExJgErg_tey0n7dm5cZYWLp2sG_HsPw@mail.gmail.com>
Message-ID: <20140307223003.53d17887@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Mar 2014 22:11:33 +0100, Fabio Porcedda wrote:

> > Ok, but not on ARM or MIPS, and probably not on many other 32 bits
> > architectures supported by Buildroot. Bottom line: testing 'gcc -m32'
> > is not a good way of testing whether the architecture is 32 bits or is
> > a 64 bits architecture capable of building and running 32 bits binaries.
> 
> We need to test if 32bit binaries are built only for 64bit host architectures.
> Which are the 64bit host architectures that Buildroot supports?

Potentially any 64 bits architecture, we don't have particular
dependencies on the host architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
