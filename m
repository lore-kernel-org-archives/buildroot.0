From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Dec 2018 14:09:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: backport meson cpp fix
In-Reply-To: <CADvTj4rGw7aHWwLWUju5DgUJHCT6ccdYryUkW1jFTSjYgCOCyQ@mail.gmail.com>
References: <1546084152-27181-1-git-send-email-james.hilliard1@gmail.com>
 <20181229124824.GA14286@scaer>
 <CADvTj4rGw7aHWwLWUju5DgUJHCT6ccdYryUkW1jFTSjYgCOCyQ@mail.gmail.com>
Message-ID: <20181229130905.GB14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-12-29 07:04 -0600, James Hilliard spake thusly:
> On Sat, Dec 29, 2018 at 6:48 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > diff --git a/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
> > > new file mode 100644
> > > index 0000000..f6eea34
> > > --- /dev/null
> > > +++ b/package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch
> > > @@ -0,0 +1,40 @@
> > > +From de8eab973f4d4b0f1f1eb8169165be524aefa306 Mon Sep 17 00:00:00 2001
> > > +From: James Hilliard <james.hilliard1@gmail.com>
> > > +Date: Thu, 27 Dec 2018 09:16:20 +0800
> > > +Subject: [PATCH 1/1] meson: use cross compilation compatible c++ check
> >
> > This is not the commit that was applied upstream. Please, really do a
> > backport, i.e.:
> I wasn't able to get it to apply without first cherry picking it on
> top of the v240.

Then still do a backport, adapt to v240, and say so:

    [james.hilliard1 at gmail.com: backport from upstream, adapt to v240]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
