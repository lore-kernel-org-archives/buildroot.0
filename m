From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Fri, 13 Mar 2015 00:23:02 +0100
Subject: [Buildroot] [PATCH] am335x-pru-package: Add hash file
In-Reply-To: <87twxphlxf.fsf@dell.be.48ers.dk>
References: <5501F210.6020600@dawncrow.de> <87twxphlxf.fsf@dell.be.48ers.dk>
Message-ID: <55021FD6.1080104@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.03.2015 um 23:48 schrieb Peter Korsgaard:
>>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:
> 
>  > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>  > ---
>  >  package/am335x-pru-package/am335x-pru-package.hash | 2 ++
>  >  1 file changed, 2 insertions(+)
>  >  create mode 100644 package/am335x-pru-package/am335x-pru-package.hash
> 
>  > diff --git a/package/am335x-pru-package/am335x-pru-package.hash
>  > b/package/am335x-pru-package/am335x-pru-package.hash
>  > new file mode 100644
>  > index 0000000..dcb15f6
>  > --- /dev/null
>  > +++ b/package/am335x-pru-package/am335x-pru-package.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally computed:
>  > +sha256
>  > e3d712c90070e2d4d2fceb798a3a916c375640f5614415bbe1b2a786f18af956
>  > am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.tar.gz
> 
> am335x-pru-package comes from git through the github helper, and I'm not
> sure we can expect to always get the exact same hash from future
> downloads.
> 

Hi,

I tried multiple times, but thinking twice you are right, maybe even adding a branch might change something.
Be free to remove this and the avrdude patch from the tracker.
