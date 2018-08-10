From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Aug 2018 15:36:46 -0700
Subject: [Buildroot] [PATCH 1/6] tini: new package
In-Reply-To: <CANQCQpa9x_Re_A1+j9Zt7CPEXfxXwp8134G2_=u4TxxhonF3mQ@mail.gmail.com>
References: <20180715010732.21765-1-christian@paral.in>
 <CANQCQpa9x_Re_A1+j9Zt7CPEXfxXwp8134G2_=u4TxxhonF3mQ@mail.gmail.com>
Message-ID: <CA+h8R2pt3fgP6OK2MQE=V_Y88ubbThHcTX6G9UwZmCH8vr2v5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Aug 10, 2018 at 6:54 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> On Sat, Jul 14, 2018 at 8:15 PM Christian Stewart <christian@paral.in> wrote:
> > Tini is a minimal init process to act as PID 1 for containers.
>
> I see this patch is in a "Not Applicable" state.  This package is
> useful as a minimal init in the most basic of LXC containers (cases
> where docker is overkill).  Our use case had the rootfs being shared
> with the container and this init could remain dyn linked.
>
> I couldn't see a clear path in the thread on next steps.  I'm glad to
> respin with an update.

Docker is now taking a more direct approach to dealing with process
reaping and other concerns Tini was previously used to address.
Regardless; the intent of adding Tini is not to satisfy a Docker
requirement.

Best,
Christian
