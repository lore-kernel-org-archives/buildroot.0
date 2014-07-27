From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Mon, 28 Jul 2014 10:00:55 +1200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
In-Reply-To: <20140727153627.1f67f576@free-electrons.com>
References: <1401006257-10688-1-git-send-email-oli.vogt.pub01@gmail.com>
 <20140727153627.1f67f576@free-electrons.com>
Message-ID: <CAAwwcmRgA-6FJuQg6Y7LPVFPxz_bQqicwug73rt-6cd+irNQiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas

I added the MIT licence because:
----------
grep -inrA3 -B5 "license" *
:   :   :   :   :   :
flup/server/paste_factory.py-1-# (c) 2005 Ian Bicking and contributors;
written for Paste (http://pythonpaste.org)
flup/server/paste_factory.py:2:# Licensed under the MIT license:
http://www.opensource.org/licenses/mit-license.php
flup/server/paste_factory.py-3-
flup/server/paste_factory.py-4-from flup.server import NoDefault
flup/server/paste_factory.py-5-
:   :   :   :   :   :
----------

Thank you for accepting flup, I have used it happily for a while on an ARM
iMX233 board. No more rebasing :-)

Regards, oli


On 28 July 2014 01:36, Thomas Petazzoni <thomas.petazzoni@free-electrons.com
> wrote:

> Dear oli vogt,
>
> On Sun, 25 May 2014 20:24:17 +1200, oli vogt wrote:
> > This module is useful to implement a fastCGI webserver
> > Tested with ARM and Python 2.7.6
> >
> > Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
> > ---
> >  package/Config.in                  |  1 +
> >  package/python-flup/Config.in      |  9 +++++++++
> >  package/python-flup/python-flup.mk | 15 +++++++++++++++
> >  3 files changed, 25 insertions(+)
> >  create mode 100644 package/python-flup/Config.in
> >  create mode 100644 package/python-flup/python-flup.mk
>
> Thanks, applied. However, I've changed the license from 'BSD-4c, MIT'
> to just 'BSD-2c'. Let me know if you believe this is wrong, but it
> seemed to be matching what the package really uses.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140728/6df22fc7/attachment.html>
