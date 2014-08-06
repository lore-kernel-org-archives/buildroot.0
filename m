From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 12:03:20 +0200
Subject: [Buildroot] [PATCH] gdb: don't block building on AArch64 systems
In-Reply-To: <87wqamja43.fsf@linaro.org>
References: <1407244453-3082-1-git-send-email-alex.bennee@linaro.org>
 <20140805162059.26366e25@free-electrons.com>
 <CAFbHwiRnPZhnXVwZbZreJS-DsO2c8xe1S8=72yH0R7y_bHdFug@mail.gmail.com>
 <87wqamja43.fsf@linaro.org>
Message-ID: <20140806120320.09bf7e3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Benn?e,

On Wed, 06 Aug 2014 09:23:58 +0100, Alex Benn?e wrote:

> >> The real commit who made gdb unavailable on AArch64 is
> >> 0e49733b306b353aad3a29a2c7a6faf25841ef0b. I believe at the time (April
> >> 2013), AArch64 was maybe not supported in the mainline gdb.
> 
> My mistake, I got lost in the maze of GDB Config.in changes.

No problem!

> >> Therefore, could you check when AArch64 support was added in mainline
> >> gdb ? We currently allow selecting either gdb 7.6 and 7.7 in Buildroot.
> >
> > AArch64 has been supported since gdb 7.6 (although 7.8 is much nicer
> > to use due to bug fixes).
> 
> I'll resubmit with a re-worded commit message.

Great, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
