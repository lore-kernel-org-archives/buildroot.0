From: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Date: Sun, 8 Feb 2015 20:29:11 +0000
Subject: [Buildroot] [PATCH 1/1] batctl: new package
In-Reply-To: <20150208212358.3cbe7337@free-electrons.com>
References: <1423424838-5348-1-git-send-email-zettelmeyerj@goooglemail.com>
 <20150208212358.3cbe7337@free-electrons.com>
Message-ID: <CAFNoKauR61bagPDWdUk5HL7QiZP5_oLNQdHd+j8nwj7C_nHeBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

oh you are right, haven't seen all those comments. I'll try to adjust the
file accordingly.
And i'll try to find out where this "user" is comming from.

Thank you
Jens

2015-02-08 20:23 GMT+00:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Jens Zettelmeyer,
>
> On Sun,  8 Feb 2015 19:47:18 +0000, Jens Zettelmeyer wrote:
> > From: user <zettelmeyerj@goooglemail.com>
>
> Does not look good.
>
> > Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
> > ---
> >  package/Config.in          |  1 +
> >  package/batctl/Config.in   |  9 +++++++++
> >  package/batctl/batctl.hash |  2 ++
> >  package/batctl/batctl.mk   | 23 +++++++++++++++++++++++
> >  4 files changed, 35 insertions(+)
> >  create mode 100644 package/batctl/Config.in
> >  create mode 100644 package/batctl/batctl.hash
> >  create mode 100644 package/batctl/batctl.mk
>
> Also, you have taken into account none of the comments I made at:
> http://lists.busybox.net/pipermail/buildroot/2015-February/118951.html.
>
> Can you look at these comments?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150208/f60384ce/attachment.html>
