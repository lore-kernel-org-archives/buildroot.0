From: Nicholas Walton <nicholas.walton@gmail.com>
Date: Sun, 04 Sep 2016 17:52:08 +0000
Subject: [Buildroot] [PATCH] package/binutils: Disable -Os for Thumb-2
 only platforms
In-Reply-To: <20160904144314.2dd0f130@free-electrons.com>
References: <1472978990-14884-1-git-send-email-romain.naour@gmail.com>
 <20160904144314.2dd0f130@free-electrons.com>
Message-ID: <CAKXOQBx=jhz+8464896oWub0JzFuvRvGFfgwTwF6KkcjVVXkzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 4, 2016 at 5:43 AM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Sun,  4 Sep 2016 10:49:50 +0200, Romain Naour wrote:
>
> > +# Workaround a build issue with -Os on Thumb-2 only platforms
> > +# (such as Cortex-M). (Binutils 2.25.1 and 2.26.1)
>
> I'm a bit surprised this happens only on Thumb-2 only platforms,
> and not on all ARM platforms, when Thumb-2 is chosen. But I'm far from
> understanding all the fine details of relocations.
>

I found a bug report about a similar error in a different package, and I
saw it on a non-Thumb-2 platform (ARM9). I'll send more details when I'm in
the office on Tuesday, as I don't have the error message, package name, or
bug report in front of me.

Regards,
Nicholas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160904/b144a93e/attachment.html>
