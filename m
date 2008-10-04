From: Grant Likely <grant.likely@secretlab.ca>
Date: Sat, 4 Oct 2008 16:55:05 -0600
Subject: [Buildroot] glibc
In-Reply-To: <20081001075303.GC18546@mx.loc>
References: <1222827654.6792.0.camel@kokopelli> <20081001075303.GC18546@mx.loc>
Message-ID: <20081004225505.GA11515@secretlab.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 01, 2008 at 09:53:03AM +0200, Bernhard Reutner-Fischer wrote:
> On Tue, Sep 30, 2008 at 07:20:54PM -0700, Brian Beattie wrote:
> >has anybody built buildroot with glibc support?  or is it in there and I
> >just missed it?
> 
> You can theoretically use an "external toolchain" which uses glibc. Not
> sure what purpose such a thing would serve though.

I've done just such a thing.  I've used the codesourcery toolchain for
powerpc which uses glibc.  It works well for me.

The reason I did it was that I was having trouble getting buildroot to
produce a reliable crosscompiler for powerpc and wanted to use something
known-good and stable since gcc cross compilers still seem to have a bit
of black-magic associated with building one that works and what patches
are required, especially in PPC land.

g.
