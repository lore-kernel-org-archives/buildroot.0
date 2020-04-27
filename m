From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 27 Apr 2020 18:52:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: new packge
In-Reply-To: <20200427073510.7b889f25@windsurf.home>
References: <20200227204335.25823-1-asafka7@gmail.com>
 <20200425225358.1dcd475b@windsurf.home>
 <CALFsTFWmorvAwBK5t44rdX8u2uux+isunOB8M4irPvGBMUnGiA@mail.gmail.com>
 <20200427073510.7b889f25@windsurf.home>
Message-ID: <CALFsTFXkc=rArGngs0+gsxj0aPGn6qAopuRmB=iEdbtuQeEvNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Apr 27, 2020 at 8:35 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 26 Apr 2020 21:03:04 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > > Could you try to clarify what is the license of this package ? It would
> > > be really good for PyPi to be a bit more "strict" in the description of
> > > the licenses.
> > Thanks for the reply!
> > I privately contacted the maintainer of the package and he told me he released
> > the package under BSD-2-Clause (as in the current patch).
> > Moreover, according to spdx_lookup, it has 90.5% confidence that BSD-2-Clause
> > is the type of the license file committed in the repo (which, as
> > stated in the commit
> > message, unfortunately isn't shipped with the package).
> >
> > Do you want to apply the current version of the patch?
> > Do you have any other suggestion?
>
> If you are in contact with the maintainer, it would be nice if he could
> add an explicit "LICENSE" file that clarifies the license.
>
The maintainer has just added a section in the license file regarding the
use of "BSD Protection License" in core.c.
It can be seen here:
https://github.com/ilanschnell/bsdiff4/commit/935149e7828b0e04fc95d34030479d8e297aae00
In addition, I've sent a PR for him with a MANIFEST.in file in order to include
the license file in the package.
Until it's merged and a new version is released, I'll send a v2 stating the
package has BSD-2-Clause and BSD-Protection.

> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Regards,
Asaf.
