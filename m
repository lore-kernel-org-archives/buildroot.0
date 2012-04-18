From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Apr 2012 17:39:06 +0200
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <201204162338.49807.yann.morin.1998@free.fr>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
 <4F8C8CE2.3000702@lucaceresoli.net>
 <201204162338.49807.yann.morin.1998@free.fr>
Message-ID: <4F8EE01A.7010006@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN:

>> Another example: busybox.
>>
>> This is a messy as well. The LICENSE file carries this heading:
>>>   --- A note on GPL versions
>>>
>>>   BusyBox is distributed under version 2 of the General Public License (included
>>>   in its entirety, below).  Version 2 is the only version of this license which
>>>   this version of BusyBox (or modified versions derived from this one) may be
>>>   distributed under.
>>>
>>>   ------------------------------------------------------------------------
>>>   		GNU GENERAL PUBLIC LICENSE
>>>   		Version 2, June 1991
>> That looks clear, but many source files seem to disagree:
>> $ head coreutils/uname.c
>>>    * Licensed under GPLv2 or later, see file LICENSE in this source tree.
> What this means is that the work as a whole is available under the GPLv2,
> but that if you use individual files out-side of busybox, you can use that
> file under the license that is specified (IANAL!).
>
>  From the buildroot perspective, busybox is GPLv2.

Is this your personal view or did you get such info from upstream?
I would not code in Buildroot any interpretation (even if from a trustworthy
expert) that does not come from upstream.

Luca
