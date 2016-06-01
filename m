From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:05:33 +0200
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
In-Reply-To: <trinity-d3b293e2-4a13-4cd4-95af-c77cc680aa35-1464814370051@3capp-mailcom-bs13>
References: <20160601102720.3929-1-daggs@gmx.com>
 <20160601141655.5649aa21@free-electrons.com>
 <trinity-d3b293e2-4a13-4cd4-95af-c77cc680aa35-1464814370051@3capp-mailcom-bs13>
Message-ID: <20160601230533.04ca63d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 22:52:50 +0200, daggs wrote:

> > Would it be possible to use your complete name for your contributions?
> >   
> I'd rather not, is this a limitation?

Well, like the Linux kernel, we use the Developer Certificate of Origin
(DCO), which is why we have this Signed-off-by line. And this requires
having the real name. From Documentation/SubmittingPatches in the Linux
kernel:

"""
The sign-off is a simple line at the end of the explanation for the
patch, which certifies that you wrote it or otherwise have the right to
pass it on as an open-source patch.  The rules are pretty simple: if you
can certify the below:

        Developer's Certificate of Origin 1.1

        By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.

then you just add a line saying

        Signed-off-by: Random J Developer <random@developer.example.org>

using your real name (sorry, no pseudonyms or anonymous contributions.)
"""

See the last line, which is the one important here.

> > Also, please add a hash file for this package.
> >   
> > > +LIBAMCODEC_LICENSE = GPL  
> > 
> > This should be more specific: GPLv2, GPLv2+, GPLv3, GPLv3+.
> > 
> > Also, please add a value for <pkg>_LICENSE_FILES.
> >   
> there is no license files or label whatsoever, the only header I saw is like this:
> /**
>  * \file adec-external-ctrl.c
>  * \brief  Audio Dec Lib Functions
>  * \version 1.0.0
>  * \date 2011-03-08
>  */
> /* Copyright (C) 2007-2011, Amlogic Inc.
>  * All right reserved
>  *
>  */

Then, how did you conclude that it was licensed under the GPL ?

If what you show here is all what you have in terms of licensing, then
this package is not under the GPL, and is not even freely
redistributable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
