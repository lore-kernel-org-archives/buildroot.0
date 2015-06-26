From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 26 Jun 2015 14:38:28 -0400
Subject: [Buildroot] [PATCH 1/1] libucl: new package
In-Reply-To: <20150626203449.240aac79@free-electrons.com>
References: <1435328383-24851-1-git-send-email-nimaim@gmail.com>
 <20150626203449.240aac79@free-electrons.com>
Message-ID: <CALoSW65CWXe94KyCYAnKhSC=y5c3-V4DcrCQpxMYKdsUvD144w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jun 26, 2015 2:34 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Nimai Mahajan,
>
> On Fri, 26 Jun 2015 10:19:43 -0400, Nimai Mahajan wrote:
> > From: Nimai Mahajan <nimaim@gmail.com>
> >
> > Libucl is a high performance and flexible JSON/YAML/etc. parser for C.
> >
> > https://github.com/vstakhov/libucl
> >
> > Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> > ---
> >  package/Config.in          |  1 +
> >  package/libucl/Config.in   | 16 ++++++++++++++++
> >  package/libucl/libucl.hash |  2 ++
> >  package/libucl/libucl.mk   | 14 ++++++++++++++
> >  4 files changed, 33 insertions(+)
> >  create mode 100644 package/libucl/Config.in
> >  create mode 100644 package/libucl/libucl.hash
> >  create mode 100644 package/libucl/libucl.mk
>
> I've applied your patch, after doing a good number of changes:
>
>     [Thomas:
>       - remove hash file, should not be used for github downloads
>       - rewrap Config.in help text
>       - remove trailing white space in Config.in.
>       - add missing host-pkgconf dependency, without which the package
>         doesn't autoreconf properly.
>       - fix license: it is BSD-2c, not just BSD.]
>
> Also, it would be good to add explicit support for the optional
> dependencies of libucl. See the configure.ac script to find which
> dependencies libucl can use.
>
> Thanks for your contribution!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Thomas,

Thank you very much. I am still learning how the whole system works but now
understand the requirements for the packages a lot better. Looking forward
to contributing more in the future.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150626/61f675f8/attachment-0001.html>
