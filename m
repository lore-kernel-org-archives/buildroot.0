From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 30 Dec 2018 21:34:46 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: Bump to version 2.56.3
In-Reply-To: <20181230212745.196c01c3@windsurf>
References: <20181207173836.13091-1-petr.vorel@gmail.com>
 <20181230193432.GA10930@x230> <20181230212745.196c01c3@windsurf>
Message-ID: <20181230203445.GA24639@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I tried to merge a similar bump a few weeks ago, and it caused massive
> build failures, so I had to revert. In the mean time, I applied the
> pkg-config bump, which also caused lots of issues, which have
> apparently now been all addressed, so it will be a good time to merge a
> libglib2 bump.

> However, was this tested with a large number of libglib2 reverse
> dependencies ?

> See
> https://git.buildroot.org/buildroot/commit/package/libglib2?id=2694222c3d3663d9fcc55e6cf44a45b74b43793f
> for details.

Thanks for info. I've noticed this revert before. Problematic version was 2.58.1
(updated from 2.56.1). That's why my commit only updated to 2.56.3 (latest
2.56.x), which should be ok.

> Did you try to build dbus-glib on the latest master, with the libglib2
> bump included ?

> I would be more convinced with a commit log that provides a defconfig
> with lots of libglib2 reverse dependencies enabled, with the statement
> that this defconfig continues to build fine after the libglib2 bump.
No problem, I'll do more testing (with both versions) in January.

> Thanks!

> Thomas


Kind regards,
Petr
