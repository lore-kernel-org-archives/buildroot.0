From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 07:35:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bsdiff4: new packge
In-Reply-To: <CALFsTFWmorvAwBK5t44rdX8u2uux+isunOB8M4irPvGBMUnGiA@mail.gmail.com>
References: <20200227204335.25823-1-asafka7@gmail.com>
 <20200425225358.1dcd475b@windsurf.home>
 <CALFsTFWmorvAwBK5t44rdX8u2uux+isunOB8M4irPvGBMUnGiA@mail.gmail.com>
Message-ID: <20200427073510.7b889f25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Apr 2020 21:03:04 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > Could you try to clarify what is the license of this package ? It would
> > be really good for PyPi to be a bit more "strict" in the description of
> > the licenses.  
> Thanks for the reply!
> I privately contacted the maintainer of the package and he told me he released
> the package under BSD-2-Clause (as in the current patch).
> Moreover, according to spdx_lookup, it has 90.5% confidence that BSD-2-Clause
> is the type of the license file committed in the repo (which, as
> stated in the commit
> message, unfortunately isn't shipped with the package).
> 
> Do you want to apply the current version of the patch?
> Do you have any other suggestion?

If you are in contact with the maintainer, it would be nice if he could
add an explicit "LICENSE" file that clarifies the license.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
