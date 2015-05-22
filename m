From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 22 May 2015 11:18:08 -0500
Subject: [Buildroot] [PATCH 1/1] package/cpupower: new package
In-Reply-To: <CALe+oY9Bu2oO9aoEv0+YTeN9TZ2tDFF=cocXT+eWo3o1SOi+HA@mail.gmail.com>
References: <1432249380-5920-1-git-send-email-james.knight@rockwellcollins.com>
 <CANQCQpb1FtMMi8zmmS8CiSOmCb7osBBKfG2M0YTp4H8bf=qwOg@mail.gmail.com>
 <CALe+oY9Bu2oO9aoEv0+YTeN9TZ2tDFF=cocXT+eWo3o1SOi+HA@mail.gmail.com>
Message-ID: <CANQCQpbf7EWNu19y=-r2=oZdXs+_ZzAFR=MU-k+=td4y9oETHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,


On Fri, May 22, 2015 at 11:09 AM, James Knight
<james.knight@rockwellcollins.com> wrote:
> Thanks Matthew.
>
Please don't top post.

> I was attempting to follow the `perf` package style for this new package:
>
>    http://git.buildroot.net/buildroot/tree/package/perf/perf.mk
>
> My main reason for following this was to prevent having the process from
> re-downloading the kernel/etc. again. I don't mind adding license
> information as well but I don't know the correct way in doing this since
> this package is based off the selected kernel option (although I can just
> copy the license value set by LINUX_LICENSE). Is the perf package
> out-of-date? I don't mind following the `spidev_test` package; I just want
> to make sure I'm doing it right.

Yep, completely understand that approach.  Ah perf, that doesn't have
license info.....  I'll leave that as an open question (I'm not sure)

Thanks,
-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
