From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 9 May 2013 10:48:34 -0700
Subject: [Buildroot] [PATCH] socketcand: add license information
In-Reply-To: <20130509194055.19207a4f@skate>
References: <1368120627-26385-1-git-send-email-gilles.talis@gmail.com>
 <20130509194055.19207a4f@skate>
Message-ID: <CAKcgs2z9ZfK6yNBG5oRJ5nq7jJ6SKaiqkuCmMV-+8xu2c0gWxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

No, I am not sure. And I agree with you, the license information for this
package is scarce and confusing. Arch-linux distribution tagged it as GPLv2
[1], and the package maintainer did not seem to disagree. This is why I
went with GPLv2. Would you prefer we did not add license information at all?

Thanks
Gilles

[1] https://aur.archlinux.org/packages/socketcand-git/


2013/5/9 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Gilles Talis,
>
> On Thu,  9 May 2013 10:30:27 -0700, Gilles Talis wrote:
>
> > +SOCKETCAND_LICENSE = GPLv2
>
> Are you sure? The only licensing information I can find is in
> socketcand.c, and it says:
>
>  * Authors:
>  * Andre Naujoks (the socket server stuff)
>  * Oliver Hartkopp (the rest)
>  * Jan-Niklas Meier (extensions for use with kayak)
>  *
>  * Copyright (c) 2002-2009 Volkswagen Group Electronic Research
>  * All rights reserved.
>  *
>  * Redistribution and use in source and binary forms, with or without
>  * modification, are permitted provided that the following conditions
>  * are met:
>  * 1. Redistributions of source code must retain the above copyright
>  *    notice, this list of conditions and the following disclaimer.
>  * 2. Redistributions in binary form must reproduce the above copyright
>  *    notice, this list of conditions and the following disclaimer in the
>  *    documentation and/or other materials provided with the distribution.
>  * 3. Neither the name of Volkswagen nor the names of its contributors
>  *    may be used to endorse or promote products derived from this software
>  *    without specific prior written permission.
>  *
>  * Alternatively, provided that this notice is retained in full, this
>  * software may be distributed under the terms of the GNU General
>  * Public License ("GPL") version 2, in which case the provisions of the
>  * GPL apply INSTEAD OF those given above.
>  *
>  * The provided data structures and external interfaces from this code
>  * are not restricted to be used by modules with a GPL compatible license.
>
> So the license is either GPLv2 or BSD-3c.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130509/fbe7df26/attachment-0001.html>
