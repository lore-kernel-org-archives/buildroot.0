From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 3 Mar 2017 23:20:15 +0100
Subject: [Buildroot] [Bug 9706] Can't download newer revisions of
 package from PyPI
In-Reply-To: <bug-9706-163-8oFTRdRjiE@https.bugs.busybox.net/>
References: <bug-9706-163@https.bugs.busybox.net/>
 <bug-9706-163-8oFTRdRjiE@https.bugs.busybox.net/>
Message-ID: <CAGm1_kuqjGpsnY9aAQHp+P-FvFCqFEMsPaYKuYp2UM7xissctg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Mar 3, 2017 at 11:00 PM,  <bugzilla@busybox.net> wrote:
> https://bugs.busybox.net/show_bug.cgi?id=9706
>
> Arnout Vandecappelle <arnout@mind.be> changed:
>
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>              Status|NEW                         |RESOLVED
>          Resolution|---                         |INVALID
>
> --- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
> When bumping the package, SUPERVISOR_SITE should change from the current
>
> http://pypi.python.org/packages/source/s/supervisor
>
> to
>
> https://pypi.python.org/packages/44/80/d28047d120bfcc8158b4e41127706731ee6a3419c661e0a858fb0e7c4b2d
>
> but it's not unusual for the _SITE to change when the version is bumped.
>
> I don't see how this is a bug, so I'm closing as invalid. If you disagree, feel
> free to reopen.
>
> PS if you do bump the package, don't forget to send the patch to the Buildroot
> mailing list for upstream inclusion.

I've posted an RFC [1] concerning this issue.

[1] https://patchwork.ozlabs.org/patch/708384/

Yegor
