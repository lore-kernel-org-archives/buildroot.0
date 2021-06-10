From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 10 Jun 2021 22:37:34 +0300
Subject: [Buildroot] [PATCH v2 00/28] sunxi: use mainline
 arm-trusted-firmware
In-Reply-To: <20210610152205.451e1374@windsurf>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210610152205.451e1374@windsurf>
Message-ID: <YMJp/rvETuvzWPSL@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Thanks a lot for this work! See below some comments/doubts, though.
> 
> On Wed,  9 Jun 2021 22:59:35 +0300
> Sergey Matyukevich <geomatsi@gmail.com> wrote:
> 
> > Finally, let me re-iterate once again: I have only orangepi-zero-plus2
> > board at my disposal. So only this board has been tested. For all the
> > other boards only build tests have been completed. ATF provides only
> > basic support for H5/A64 and SCP firmware is disabled, so I do not
> > expect any surprises here. But still, any help with boot tests on
> > other H5/A64 sunxi boards is more than welcome.
> 
> Then, I'm not sure of the approach. Indeed, the defconfigs are really
> meant to be configurations that have been tested on HW. If we start
> changing them without testing them on HW, their purpose kind of goes
> away. What is your plan here? Wait for the initial submitters to
> confirm that the change is OK and working on HW ? It might take a
> while. Or should we give up on that promise that all defconfigs have
> been tested on HW ?

I believe that promise should be kept. My plan is to wait for a while
and to collect feedback from the boards submitters/maintainers, if any. 
In the meantime we can come to the decision on TF-A stack protection.
Then, final version of the patch set will include only tested boards.

Regards,
Sergey
