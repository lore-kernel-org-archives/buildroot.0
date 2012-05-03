From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 03 May 2012 08:45:34 +0200
Subject: [Buildroot] Console login root needing a password
In-Reply-To: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
References: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
Message-ID: <4FA2298E.5000807@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 03.05.2012 01:38, schrieb Nigel Sollars:
> Hello,
> 
> Ive built buildroot with a toolchain successfully,  however trying to login over the console requires a password.  The passwd/shadow is the default.
> 
> Looking around google apparently this has to do with wchar is this true?,  if so is there a fix since this is required for gdb on the target.

Have you tried something like this?

ttyS0::respawn:-/bin/sh

Yegor
