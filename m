From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 22:11:33 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <20140307215801.69039f22@skate>
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
Message-ID: <CAHkwnC9Yx_uQqZQwiqmExJgErg_tey0n7dm5cZYWLp2sG_HsPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 9:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 7 Mar 2014 21:51:57 +0100, Fabio Porcedda wrote:
>
>> Reading the gcc documentation the option -m32 work even on PowerPC:
>> http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/RS_002f6000-and-PowerPC-Options.html
>
> Ok, but not on ARM or MIPS, and probably not on many other 32 bits
> architectures supported by Buildroot. Bottom line: testing 'gcc -m32'
> is not a good way of testing whether the architecture is 32 bits or is
> a 64 bits architecture capable of building and running 32 bits binaries.

We need to test if 32bit binaries are built only for 64bit host architectures.
Which are the 64bit host architectures that Buildroot supports?

-- 
Fabio Porcedda
