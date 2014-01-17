From: Freedreamer <freedreamer@email.it>
Date: Fri, 17 Jan 2014 13:39:19 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <20140117113153.GB10730@pc-eric>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
Message-ID: <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/17 Eric Le Bihan <eric.le.bihan.dev@free.fr>

> Hi!
>
> On Fri, Jan 17, 2014 at 11:39:10AM +0100, Freedreamer wrote:
>
> >    In my br rootfs I 've been using a lot of scripts based on python and
> a
> >    lot of them are based on Gobject. Unfourtanetely when I try to start
> one I
> >    always got a problem 'cause python misses the support for the Gobject.
>
> Which versions of Python and GObject bindings are you using? Two combos are
> possible:
>
> 1) Python 2.7 + Python-GObject < 2.28 (classic Python C bindings).
> 2) Python 3.x + Python-GObject > 3.x (bindings based on GObject
> introspection).
>
> It looks like there are no packages (yet) for either one.
> Packaging python-gobject 2.28 (also known as PyGtk) should be doable, but
> the
> other combo requires to package gobject-introspection.
>
> Best regards,
> ELB
>

Hi,

now i've been using python 2.7. you confirm there is no package?

Marco
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140117/8941cb2c/attachment.html>
