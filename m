From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Aug 2012 23:30:32 +0200
Subject: [Buildroot] [RFC] "select" vs. "depends on" : a proposal for a
 workaround
In-Reply-To: <CA+wH296dDQGFnu2rcYD5VZq9RYK3Q1qfxHc6x4dWghfQ4DwCjQ@mail.gmail.com>
References: <201208072252.18028.yann.morin.1998@free.fr>
 <20120809114001.6e9d2a10@skate>
 <201208091158.19469.yann.morin.1998@free.fr>
 <20120809133053.51033341@skate>
 <CA+wH296dDQGFnu2rcYD5VZq9RYK3Q1qfxHc6x4dWghfQ4DwCjQ@mail.gmail.com>
Message-ID: <20120810233032.795f1c87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 9 Aug 2012 12:57:02 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> Is that "I'd prefer to see a patch to add this functionality to
> buildroot's kconfig?".

Yes.

And of course, as Yann said, a functionality added to the mainline
kconfig so that we don't have to carry this (most likely complicated)
modification as a patch against the official kconfig.

I started looking at this a bit, but the kconfig code is not that
simple, and so horribly under-documented.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
