From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 08 Sep 2019 03:14:12 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-06
References: <20190907061322.CC0778821B@hemlock.osuosl.org>
Message-ID: <5d749c3417009_76283f8016171fd09215b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Chris
+ Fabrice
+ Yann

On Sat, Sep 07, 2019 at 03:13 AM, Thomas Petazzoni wrote:

[snip]

> Detail of runtime-test failures
> -------------------------------
> 
>              runtime-test |                        link to the job                        | orph?
> --------------------------+---------------------------------------------------------------+------
> ...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126471  | ORPH 
> ...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126473  | ORPH 
> ...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126476  | ORPH 
> ...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126477  | ORPH 

These 4 started to fail after a patch. I replied to the patch.
http://lists.busybox.net/pipermail/buildroot/2019-September/258897.html

> ...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126475  | ORPH 

This is the same timing issue Yann analysed some time ago.
http://lists.busybox.net/pipermail/buildroot/2019-August/256728.html
[ TIME ] Timed out waiting for device /dev/ttyAMA0.
[DEPEND] Dependency failed for Serial Getty on ttyAMA0.

>              TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126581  | ORPH 

This one started to fail on the last syslog-ng bump. I replied to the patch.
http://lists.busybox.net/pipermail/buildroot/2019-September/258895.html

Regards,
Ricardo
