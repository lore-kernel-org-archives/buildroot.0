From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 00:38:34 +0200
Subject: [Buildroot] [PATCH 04/11 RFC] support/scripts: do not display
 virtual packages in generated lists
In-Reply-To: <CAHXCMMKrXuRS5aH5tkwH197339geD1NDPmaSvHO-Gq-Yh--7=Q@mail.gmail.com>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
 <2f34830f1709a346a1b2a45415242a7e28dbfd0d.1401395407.git.yann.morin.1998@free.fr>
 <CAHXCMMKrXuRS5aH5tkwH197339geD1NDPmaSvHO-Gq-Yh--7=Q@mail.gmail.com>
Message-ID: <20140531223834.GG3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-31 23:19 +0200, Samuel Martin spake thusly:
> On Thu, May 29, 2014 at 10:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > If a package has both a 'real' and a 'virtual' definition, consider it
> > is a virtual package and do not display it in the generated package list.
> >
> > This is the case for jpeg and cryptodev, that are virtual packages, but
> > also real (but empty) packages used to provide a prompt to enable/disable
> > a choice to select an implementation. In this case, we do not want to
> > list the virtul packages, but only its implementations.
> 
> s/virtul/virtual/
> s/its implementations/their implementations/

Fixed.

> With the typo fixed, you'll have my Acked-by.

Added, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
