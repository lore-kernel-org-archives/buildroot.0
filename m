From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Sep 2014 16:45:36 +0200
Subject: [Buildroot] Sparc Leon support in Buildroot
In-Reply-To: <54072204.3020402@gaisler.com>
References: <20140701202206.153b2cf6@free-electrons.com>
 <53F4800D.2060307@gaisler.com>
 <20140820140514.67f9fb23@free-electrons.com>
 <54072204.3020402@gaisler.com>
Message-ID: <20140903164536.1a28b0d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Larsson,

On Wed, 03 Sep 2014 16:13:24 +0200, Andreas Larsson wrote:

> > Great, thanks! Also, currently, we don't have any Sparc toolchain in
> > our autobuilder testing. Normally, we try to have all architectures we
> > support tested in our autobuilders. If we were to add the Sparc
> > architecture to our testing infrastructure, would you be willing to
> > look at the potential build failures that may result from this testing?
> > (Look at http://autobuild.buildroot.org to see what the results look
> > like for other architectures).
> 
> If that would be set up, it is something I could keep an eye on. 
> However, I do not have the possibility to take responsibility for broken 
> packages.

Well, it's not really a "responsibility": most of the Buildroot
contributors are volunteers so there are no obligations. But if you can
give some help from time to time for some SPARC specific issues, that
would be nice.

Have you had some time to look at the toolchain components? As I said
earlier, we are currently keeping gcc 4.4.x only for SPARC Leon, so if
you could test if gcc 4.8.x and/or 4.9.x work fine for Leon, it would
allow us to get rid of the support for gcc 4.4.

See package/gcc/Config.in.host for the details of the gcc versions that
we allow for SPARC Leon.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
