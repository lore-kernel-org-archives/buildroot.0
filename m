From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 25 Nov 2016 08:16:39 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <20161118094547.08f2f956@free-electrons.com>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
 <20161117000239.36cd4e77@free-electrons.com>
 <671071c5-0fba-8834-3837-7f7ff5cf82fa@mind.be>
 <20161118094547.08f2f956@free-electrons.com>
Message-ID: <CAKAx1cj-YaiJ9JL=2sd84w7-CZ62G8mqw3-YYyRSJmkTm6KHGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Fri, Nov 18, 2016 at 9:45 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 18 Nov 2016 00:52:58 +0100, Arnout Vandecappelle wrote:
>
> >  Well, it makes sense to me that a package infra does something like
> that, but
> > less so that the waf package itself would do it. And it's just simpler
> if the
> > dependency is only in the infra.
> >
> >  However, I wonder if we need this dependency at all. We already require
> a
> > python (although admittedly we don't check the version). The few
> packages that
> > don't support python3 can add the dependency themselves. Building
> host-python
> > really eats into the build time...
>
> Is waf python2/python3 compliant?
>

?Yes, see here : https://waf.io/book/#_how_to_run_waf?
AFAIK, there is an internal wrapper to make code compatible with both
versions (https://github.com/waf-project/waf/blob/master/waflib/fixpy2.py).

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

?Kind regards,
Lionel?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161125/9336784e/attachment.html>
