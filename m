From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 14 Sep 2014 20:41:57 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140914125321.0d68b842@free-electrons.com>
References: <20140914125321.0d68b842@free-electrons.com>
Message-ID: <CAAXf6LVsjr8V5hgGO0oNsQSzA9dtFvTvv8PQhA-+KE3qtvL7gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 14, 2014 at 12:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Since we're still early in the cycle, it's a good time to look at the
> big patch series that are pending, and take a decision on them. I've
> compiled a subjective list of the "big" patch series that are pending,
> with some comments on each of them. Please add your own comments, and
> volunteer to review/test the series. Thanks!

Thanks a lot for sending this out, this is a great way to put focus
and make sure we can reduce the open patches!

Below my input on some of the patches:

>  * gendoc infra: make it useable for other documents (18 patches)
>    http://lists.busybox.net/pipermail/buildroot/2014-September/105678.html
>
>    I'm personally not highly interested in making the gendoc infra
>    suitable for other documents than the manual, so I'm not very
>    motivated to review this. But maybe other persons are interested,
>    especially Samuel or Thomas DS who have followed the gendoc changes?

I am definitely planning in reviewing this but did not yet get to it.
I am currently working on improving the 'Project-specific
customizations' chapter in the manual and would like to finish that
(almost ready) before doing something else.

>  * CMake cleanup (5 patches)
>    http://lists.busybox.net/pipermail/buildroot/2014-August/104794.html
>
>    Needs review.

I see Yann provided some comments here.
I performed some basic testing on the first iteration of the series
(which is the same as v2 where only typos were fixed and the last
patch was discarded) and did not see obvious problems.

>
>  * ncurses wide support (4 patches)
>    http://lists.busybox.net/pipermail/buildroot/2014-August/104715.html
>
>    Needs testing. We really need to get that one merged early, to get
>    some autobuilder coverage.

Would autobuild testing not suffice in this case? Gustavo already
indicated he did an allyespackageconfig to test. There could be some
changes since then but that would easily be found by autobuild, no ?

>  * packages: rename _OPT into _OPTS (2 patches)
>    http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html
>
>    Thomas DS, could you respin this patch series?

First question is: do you accept the principle of the change?
If the patches are acceptable, then clearly I can rebase them.

Thanks,
Thomas
