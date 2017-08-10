From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 10 Aug 2017 16:10:10 -0300
Subject: [Buildroot] [PATCH v2] package/stella: bump version to 5.0.1
In-Reply-To: <fab7680a-be1e-3adb-de08-d2ee957ea6da@mind.be>
References: <1502031148-14106-1-git-send-email-sergio.prado@e-labworks.com>
 <fab7680a-be1e-3adb-de08-d2ee957ea6da@mind.be>
Message-ID: <CANu7NGtcVrJ4rwADvBqchOyNhWJ+7m1hXthu8Ls4LCh3sPTcxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

2017-08-09 20:07 GMT-03:00 Arnout Vandecappelle <arnout@mind.be>:
>
>  Hi Sergio,
>
> On 06-08-17 16:52, Sergio Prado wrote:
> > Removed 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch, since
> > stella now uses -std=c++14 that builds fine when using PPC altivec
> > vectorization.
> >
> > Update toolchain dependencies to gcc 4.9 since codebase now uses C++14
features.
> >
> > Fixes:
> >
http://autobuild.buildroot.net/results/0e787fd27537e1ff84a76bf71121048596d808a1/
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
>  I instead applied Bernd's patch to master that just fixes the gcc7 build
issue.
>
>  I've applied your patch to the next branch, but updated it to remove
Bernd's
> gcc7 fix patch again.
>
>  Can you re-test the next branch to verify that this was done correctly?

Tested on ARM (Raspberry Pi 3) and also build-tested on x86 and PPC.

Thanks,

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/cb1061ec/attachment.html>
