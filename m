From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 13 Sep 2012 09:17:23 +0100
Subject: [Buildroot] [network-manager] Apply upstream patch to fix
 compilation with kernel-headers >= 3.4
In-Reply-To: <877grzszx8.fsf@macbook.be.48ers.dk>
References: <CAG2jQ8g+0WkYnR2k-8jaLXHOFRA2OPiuQWeD==B6gdE67N=4OA@mail.gmail.com>
 <877grzszx8.fsf@macbook.be.48ers.dk>
Message-ID: <CAG2jQ8jTO66cWd8UG-=mxWgihLJf=RETGizK0q_8YOapUbGo3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 12, 2012 at 10:18 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
>  Markos> Hi,
>  Markos> Since kernel-3.4_rc1, commit
>  Markos> bf7daebb9fba540cb8864f435f153678b3e5c171[1], the ifpppstatsreq
>  Markos> structure has been removed. This leads to compilation problems for
>  Markos> network-manager in buildroot if one uses kernel-headers >= 3.4.
>  Markos> Upstream fixed this problem in commit
>  Markos>        6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f[2]. Please consider applying
>  Markos> this patch to the buildroot package. If a git commit with a Signed-off
>  Markos> line is required for that, please let me know and I will provide one.
>  Markos> Another way to solve this problem is to bump to the latest 0.9.6
>  Markos> release.
>
> Thanks for the heads up. First step is to upgrade our networkmanager
> package to the latest upstream and then add the patch. I'll try to find
> time to do so this week.
>
> --
> Bye, Peter Korsgaard

Hi Peter,

There is no need to apply this patch if you bump the package. This
patch only fixes the compilation problem for version 0.9.2.0, which is
the one we have on buildroot.

Regards,
Markos
