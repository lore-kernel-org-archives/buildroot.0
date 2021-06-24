From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 23:25:05 +0200
Subject: [Buildroot] [PATCH v2 00/28] sunxi: use mainline
 arm-trusted-firmware
In-Reply-To: <YMJp/rvETuvzWPSL@curiosity>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210610152205.451e1374@windsurf> <YMJp/rvETuvzWPSL@curiosity>
Message-ID: <20210624212505.GF2852@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-06-10 22:37 +0300, Sergey Matyukevich spake thusly:
> > Thanks a lot for this work! See below some comments/doubts, though.
> > 
> > On Wed,  9 Jun 2021 22:59:35 +0300
> > Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > 
> > > Finally, let me re-iterate once again: I have only orangepi-zero-plus2
> > > board at my disposal. So only this board has been tested. For all the
> > > other boards only build tests have been completed. ATF provides only
> > > basic support for H5/A64 and SCP firmware is disabled, so I do not
> > > expect any surprises here. But still, any help with boot tests on
> > > other H5/A64 sunxi boards is more than welcome.
> > 
> > Then, I'm not sure of the approach. Indeed, the defconfigs are really
> > meant to be configurations that have been tested on HW. If we start
> > changing them without testing them on HW, their purpose kind of goes
> > away. What is your plan here? Wait for the initial submitters to
> > confirm that the change is OK and working on HW ? It might take a
> > while. Or should we give up on that promise that all defconfigs have
> > been tested on HW ?
> 
> I believe that promise should be kept. My plan is to wait for a while
> and to collect feedback from the boards submitters/maintainers, if any. 
> In the meantime we can come to the decision on TF-A stack protection.
> Then, final version of the patch set will include only tested boards.

I haven't seen a single reply from the board custodians, so I'm marking
this whole series as rejected for now. If you have some of these boards
available on your desk, it would be great to respin a shorter series
just for those boards you could test against.

I've just left the first patch as pending, though, because there is
still something to be done about the issue.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
