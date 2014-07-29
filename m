From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 09:19:31 +0200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
In-Reply-To: <CAAwwcmRgA-6FJuQg6Y7LPVFPxz_bQqicwug73rt-6cd+irNQiA@mail.gmail.com>
References: <1401006257-10688-1-git-send-email-oli.vogt.pub01@gmail.com>
 <20140727153627.1f67f576@free-electrons.com>
 <CAAwwcmRgA-6FJuQg6Y7LPVFPxz_bQqicwug73rt-6cd+irNQiA@mail.gmail.com>
Message-ID: <20140729091931.44879b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oli Vogt,

On Mon, 28 Jul 2014 10:00:55 +1200, Oli Vogt wrote:

> I added the MIT licence because:
> ----------
> grep -inrA3 -B5 "license" *
> :   :   :   :   :   :
> flup/server/paste_factory.py-1-# (c) 2005 Ian Bicking and contributors;
> written for Paste (http://pythonpaste.org)
> flup/server/paste_factory.py:2:# Licensed under the MIT license:
> http://www.opensource.org/licenses/mit-license.php
> flup/server/paste_factory.py-3-
> flup/server/paste_factory.py-4-from flup.server import NoDefault
> flup/server/paste_factory.py-5-
> :   :   :   :   :   :
> ----------

Ok, I didn't notice this specific file. I've committed a fix that
re-adds the MIT license. Thanks for reporting this.

> Thank you for accepting flup, I have used it happily for a while on an ARM
> iMX233 board. No more rebasing :-)

Cool! Do not hesitate to contribute other changes if you have any.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
