From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 01 Apr 2018 08:04:30 +0000
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <877epst1jj.fsf@dell.be.48ers.dk>
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-2-romain.naour@gmail.com>
 <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
 <20180225223438.42357172@windsurf.home>
 <CAAXf6LWD8d24hEY2UJAJckCYfrTsTA5pDgN7YrFBwDngU7xcxw@mail.gmail.com>
 <877epst1jj.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWySp-5rUwLKruCAsgN=S0jO4o5UCtdmxnWbRF7X08EKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 31, 2018, 22:47 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
> writes:
>
> Hi,
>
>  >>> In our local tree, I had added a config option to strace for that, but
>  >>> perhaps that is overkill?
>  >>
>  >> Are you saying that you have changes in your local tree on packages
>  >> available in upstream Buildroot, and you did not submit such
>  >> changes ? :-)
>  >>
>
>  > Haha, yes indeed :-) But you may be glad to hear that I already made a
>  > list of such changes that should be upstreamable, and plan to tackle
>  > the upstreaming after merging 2018.02!
>
> Did you already get 2018.02 merged? ;)
>

The code is ready, but the drop was postponed due to other issues...

I'll get to it, don't worry :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180401/ee2d53a1/attachment.html>
