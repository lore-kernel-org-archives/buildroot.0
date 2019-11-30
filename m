From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Nov 2019 22:27:51 +0100
Subject: [Buildroot] Compiling Python packages with C extensions with
 per-package directories
In-Reply-To: <CALFsTFVNJi=CjuySUhgntAYjUvGpLUO78XoRH+bUtOH_1vw9=g@mail.gmail.com>
References: <CALFsTFVv0esYx0XKRLpRidTSu9sV1AmxT0n-A_GTNGEEuHWTxQ@mail.gmail.com>
 <20191130210725.180ee73a@windsurf>
 <CALFsTFVNJi=CjuySUhgntAYjUvGpLUO78XoRH+bUtOH_1vw9=g@mail.gmail.com>
Message-ID: <20191130222751.510a61f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Sat, 30 Nov 2019 22:57:47 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Yeah, it looks like some of your additional patches will solve those issues.
> 
> Just out of curiosity, do we have any roadmap for merging those patches or any
> "known issues" regarding this feature that have to be resolved?

My plan was to send those additional patches once the core per-package
support would be merged, which happened just a few days ago.

I hope to be able to send those additional patches next week. Note that
they don't fix all problems. For example, it is known that Qt5 is also
broken with per-package support. Andreas had sent a patch series fixing
this, but it was not trivial.

Next week, I will also try to update
https://elinux.org/Buildroot:Top_Level_Parallel_Build to keep track of
the status: what is merged, what is fixed but not merged yet, and what
are the remaining known issues.

I will also send a patch to enable per-package support usage in the
autobuilders. Not for all builds, but for a small fraction of the
builds.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
