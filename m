From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 21:58:01 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAHkwnC-g36dQ0OzSkqZdrWbjkwe3izYqpF+e81gff-ezA35H6g@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
 <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
 <20140307214651.1cb85457@skate>
 <CAHkwnC-g36dQ0OzSkqZdrWbjkwe3izYqpF+e81gff-ezA35H6g@mail.gmail.com>
Message-ID: <20140307215801.69039f22@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Mar 2014 21:51:57 +0100, Fabio Porcedda wrote:

> Reading the gcc documentation the option -m32 work even on PowerPC:
> http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/RS_002f6000-and-PowerPC-Options.html

Ok, but not on ARM or MIPS, and probably not on many other 32 bits
architectures supported by Buildroot. Bottom line: testing 'gcc -m32'
is not a good way of testing whether the architecture is 32 bits or is
a 64 bits architecture capable of building and running 32 bits binaries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
