From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 2 Jan 2014 20:21:22 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: export PATH
In-Reply-To: <87mwl3zdm3.fsf@dell.be.48ers.dk>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
 <20131111233113.2e11fd88@skate>
 <CAHXCMMJnox5o3hfiVgj2vzK=1=pbm85cF+9Jutth-4LRvLB5CA@mail.gmail.com>
 <20131115205317.GG3337@free.fr> <87mwl3zdm3.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMJgU5DSHkN5_kG2NF9+VPdjwsLyePZFRVLi0WPZ2_LyHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2013/11/17 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  >> To me, this could make easier writing post-{build,image} scripts.
>
>  > Indeed, it *is* usefull for those scripts.
>
>  > The first thing I do in br.config is to exactly set PATH to include the
>  > host/usr/bin and host/usr/sbin directories in front of the user's PATH.
>
>  > But maybe we should just set PATH at the time we call them?
>
> I *THINK* always adding those host directories to the path would be
> safe, as long as it happens after 'which' calls in the toplevel
> makefile.

This is already the case. :-)


> This would also allow us to get rid of HOST_PATH / TARGET_PATH
> (which are currently not identical, but should be).
>
> But it will need some testing.
>

For what is worth, I use this series on top of master since this first
submission
and I haven't got any problem so far.


>
> --
> Bye, Peter Korsgaard
>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140102/14f37043/attachment.html>
