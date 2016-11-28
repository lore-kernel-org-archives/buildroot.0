From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 29 Nov 2016 09:39:40 +1100
Subject: [Buildroot] [PATCH 1/1] package/libdvbcsa: fix altivec problems
 on powerpc64
In-Reply-To: <20161128092148.28b85791@free-electrons.com>
References: <cc3828a9d6d9dd16bd129e033e2463de8afcac04.1480311945.git.sam.bobroff@au1.ibm.com>
 <20161128092148.28b85791@free-electrons.com>
Message-ID: <20161128223940.GA2603@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 28, 2016 at 09:21:48AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 28 Nov 2016 16:45:52 +1100, Sam Bobroff wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/e6d22f5e0258c7ebb8a3ed39c11e014c721cd219
> > 
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > ---
> > Notes:
> > 
> > I'm not an expert on Altivec, but the fix seems reasonable and the
> > package's test programs succeed.
> > 
> >  package/libdvbcsa/0001-altivec-powerpc64.patch | 26 ++++++++++++++++++++++++++
> >  package/libdvbcsa/libdvbcsa.mk                 |  1 +
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 package/libdvbcsa/0001-altivec-powerpc64.patch
> > 
> > diff --git a/package/libdvbcsa/0001-altivec-powerpc64.patch b/package/libdvbcsa/0001-altivec-powerpc64.patch
> > new file mode 100644
> > index 0000000..9a3c91a
> > --- /dev/null
> > +++ b/package/libdvbcsa/0001-altivec-powerpc64.patch
> 
> Patches should have a description + Signed-off-by. Also, please make
> sure to submit this patch upstream. Thanks!
> 
> Thomas

Sorry, I knew that. Will fix in v2.

I had a look for an upstream, but I can't find one. It's presumably part
of (or related to) videolan but it doesn't seem to have a mailing list
or anything...

Cheers,
Sam.
