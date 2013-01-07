From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jan 2013 22:56:26 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <20130107225223.10cdf4e6@skate>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <CAAfyv36e2Yk2kHFAq+p_BOpdz56Wa6qQaBW4zYJrq=4bnUf01Q@mail.gmail.com>
 <20130107225223.10cdf4e6@skate>
Message-ID: <201301072256.26160.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Belisko, All,

On Monday 07 January 2013 Thomas Petazzoni wrote:
> On Mon, 7 Jan 2013 22:45:50 +0100, Belisko Marek wrote:
> > > You should be work specific than just BSD and GPL. Like BSD-3c or
> > > BSD-4c, GPLv2, GPLv2+, GPLv3, GPLv3+, etc.
> > After proper reading of COPYING file it seems it GPLv2+
> > "Some of the older utilities are covered by the GPL. More precisely:
> > You are free to distribute this software under the terms of the
> > GNU General Public License either version 2, or (at your option)
> > any later version." but in same file there is no mention about BSD
> > license version.
> 
> There is a BSD_LICENSE file that contains a BSD three clause license,

Actually, what matters in the content of the source files. Do some of
them refer to either license?
  - if the files only refer to GPLv2+, then the BSD-3c does not apply,
  - if the files only refer to BSD-3c, then the GPLv2+ does not apply,
  - if some file refer to one or two of the licenses, then both apply.

(/me likes how he managed to line up the above! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
