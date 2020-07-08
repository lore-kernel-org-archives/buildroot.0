From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jul 2020 18:35:00 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200707122125.102c9bea@windsurf>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
 <20200705173702.GI2273@scaer> <20200707122125.102c9bea@windsurf>
Message-ID: <20200708163500.GZ2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2020-07-07 12:21 +0200, Thomas Petazzoni spake thusly:
> On Sun, 5 Jul 2020 19:37:02 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I too got that 926208 sha256 here, with two different hg versions: 3.7.3
> > and 4.8.2.
[--SNIP--]
> Here, since there is no hash file for dvb-apps in Buildroot in any
> Buildroot version, we could change the tarball on sources.b.o.

Yup. I'd like to push the v2 from Sergio shortly. Peter, will you be in
a position to remove the archives, the one in the per-package sub-dir,m
and the one in the main dir, once the patch is applied?

> > What machine is pushing the archives to s.b.o. ?
> This machine has:
> $ hg --version
> Mercurial Distributed SCM (version 2.6.2)
> So it is even older than the 3.x and 4.x Mercurial versions you have
> tested.

That should not really matter, because the output of hg-archive has been
pretty stable. I also tested 2.8.2 (the one in my autobuilder), and it
too generated reproducible archives; I don;t expect 2.6 to be any
different (but I'm often wrong).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
