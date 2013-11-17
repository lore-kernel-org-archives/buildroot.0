From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Nov 2013 09:32:16 +0100
Subject: [Buildroot] Call for autobuild fixing for 2013.11
In-Reply-To: <CAAXf6LXwy3HGGX1W9FCcdVCRJSHMT2B=w--xvcsBxqwUXxDjqg@mail.gmail.com>
References: <CAAXf6LXwy3HGGX1W9FCcdVCRJSHMT2B=w--xvcsBxqwUXxDjqg@mail.gmail.com>
Message-ID: <CAAXf6LU8UuZELJKDjbKsK8cjGiVABpn3NP6LpEr=FqnxCkpHaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Nov 14, 2013 at 12:24 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> Now that 2013.11-rc1 is out, we have until the end of the month to fix
> remaining problems until 2013.11 is released.
>
> The autobuilders are still finding a lot of problems.
> Several developers are already looking at and fixing these problems,
> which is great. However, we can do much better.
>
> Therefore, I would like to request all developers to temporarily stop
> creating new features, adding new packages, etc. during the rest of
> this month, and focus on fixing autobuild problems (or other fixes)
> instead. With a joint effort I am sure we can fix many problems.
>
> The autobuild website is at http://autobuild.buildroot.org/, the
> statistics are at http://autobuild.buildroot.org/stats.php
> [currently this site seems to be down]
> There is also a daily mail sent to the list with the overview of the
> succeeding/failing builds.
>
> To fix a problem, you would start by downloading the defconfig from
> the autobuild site, apply it in a fresh repository, probably set a
> good value for BR2_DL_DIR, and run 'make' to see if you can reproduce
> the problem. Once you can reproduce it, you can analyze in more detail
> and create a fix.
>
> Depending on the problem, you can attempt some shortcuts. For example
> instead of building everything, you can request to build one
> particular package (foo) by running 'make toolchain foo'. If the
> problem is caused only by the overall configuration and foo itself
> (not by a missing dependency) this faster build would also show the
> problem. Remember: it's crucial that you can first reproduce the
> problem (with or without shortcut). Otherwise you may 'fix' something
> that is not broken.
>
> If you want to fix a particular problem but get stuck, don't hesitate
> in sending your findings to the list. Other developers can try to help
> you.

The autobuilders site is back online, for the time being at the
following location:
http://autobuild.humanoidz.org

Therefore, I would like to reiterate my request for looking at and
fixing these failures, to make 2013.11 more stable.

Thanks a lot for your contribution,
Thomas
