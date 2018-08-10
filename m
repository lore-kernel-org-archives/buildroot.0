From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Aug 2018 08:53:49 -0500
Subject: [Buildroot] [PATCH 1/6] tini: new package
In-Reply-To: <20180715010732.21765-1-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
Message-ID: <CANQCQpa9x_Re_A1+j9Zt7CPEXfxXwp8134G2_=u4TxxhonF3mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,
On Sat, Jul 14, 2018 at 8:15 PM Christian Stewart <christian@paral.in> wrote:
>
> Tini is a minimal init process to act as PID 1 for containers.
>
> Tini can be used to satisfy docker-engine's docker-init binary
> requirement.
>
> Signed-off-by: Christian Stewart <christian@paral.in>

I see this patch is in a "Not Applicable" state.  This package is
useful as a minimal init in the most basic of LXC containers (cases
where docker is overkill).  Our use case had the rootfs being shared
with the container and this init could remain dyn linked.

I couldn't see a clear path in the thread on next steps.  I'm glad to
respin with an update.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
