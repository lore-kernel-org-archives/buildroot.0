From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2015 23:48:28 +0100
Subject: [Buildroot] [PATCH] am335x-pru-package: Add hash file
In-Reply-To: <5501F210.6020600@dawncrow.de> (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Thu, 12 Mar 2015 21:07:44 +0100")
References: <5501F210.6020600@dawncrow.de>
Message-ID: <87twxphlxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
 > ---
 >  package/am335x-pru-package/am335x-pru-package.hash | 2 ++
 >  1 file changed, 2 insertions(+)
 >  create mode 100644 package/am335x-pru-package/am335x-pru-package.hash

 > diff --git a/package/am335x-pru-package/am335x-pru-package.hash
 > b/package/am335x-pru-package/am335x-pru-package.hash
 > new file mode 100644
 > index 0000000..dcb15f6
 > --- /dev/null
 > +++ b/package/am335x-pru-package/am335x-pru-package.hash
 > @@ -0,0 +1,2 @@
 > +# Locally computed:
 > +sha256
 > e3d712c90070e2d4d2fceb798a3a916c375640f5614415bbe1b2a786f18af956
 > am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.tar.gz

am335x-pru-package comes from git through the github helper, and I'm not
sure we can expect to always get the exact same hash from future
downloads.

-- 
Bye, Peter Korsgaard
