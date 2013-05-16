From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 May 2013 10:20:01 +0200
Subject: [Buildroot] [PATCH 1/2] libosip2: disable multi-thread support
	for toolchains without threads
In-Reply-To: <20130516094727.154da02d@skate> (Thomas Petazzoni's message of
 "Thu, 16 May 2013 09:47:27 +0200")
References: <1368654452-16294-1-git-send-email-gilles.talis@gmail.com>
 <20130516094727.154da02d@skate>
Message-ID: <87k3mznxou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Gilles Talis,
 Thomas> On Wed, 15 May 2013 14:47:31 -0700, Gilles Talis wrote:

 >> +LIBOSIP2_LICENSE = LGPL

 Thomas> Which version?

It's LGPLv2.1+:

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

I'll fix that up when I commit.

-- 
Bye, Peter Korsgaard
