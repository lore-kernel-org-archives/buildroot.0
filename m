From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:04:06 +0200
Subject: [Buildroot] [PATCH v3 04/11] package/python-ipython-genutils:
 New package
In-Reply-To: <CAGm1_ksYttP0j8VPYitGR5JB+AAVsmx2ovf_T1tNkuQgxnV2Ag@mail.gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-5-andrew.smirnov@gmail.com>
 <CAGm1_ksYttP0j8VPYitGR5JB+AAVsmx2ovf_T1tNkuQgxnV2Ag@mail.gmail.com>
Message-ID: <20170611150406.11af5845@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your review, I have taken into account your suggestions when
applying, except one. See below.

On Fri, 9 Jun 2017 21:03:40 +0200, Yegor Yefremov wrote:
> > +PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause  
> 
> Licence should be BSD-4-Clause and tarball contains COPYING.md, so

No, the license is really BSD-3-Clause. According to COPYING.md:

"""
This project is licensed under the terms of the Modified BSD License
(also known as New or Revised or 3-Clause BSD), as follows:

- Copyright (c) 2001-, IPython Development Team

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this
list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

Neither the name of the IPython Development Team nor the names of its
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.
"""

Thanks a lot for your review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
