From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 22:52:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: bump version for more
 post-2.28 fixes
In-Reply-To: <CANQCQpb0vSuqvySV2KntGGoKzKT+ZxvtqUDR7sRF-ca=FOADzQ@mail.gmail.com>
References: <20190103200911.8779-1-mark.corbin@embecosm.com>
 <CANQCQpb0vSuqvySV2KntGGoKzKT+ZxvtqUDR7sRF-ca=FOADzQ@mail.gmail.com>
Message-ID: <20190103215228.GF5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2019-01-03 15:25 -0600, Matthew Weber spake thusly:
> On Thu, Jan 3, 2019 at 2:10 PM Mark Corbin <mark.corbin@embecosm.com> wrote:
[--SNIP--]
> > -GLIBC_VERSION = glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa
> > +GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
> 
> If we wanted to remove the duplicate naming of glibc on tarballs,
> autobr, etc.  The versions like this using the describe approach can
> drop the glibc- as it and the version part of the string are
> informational.
> 
> ie.
> glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz
> ---->   glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1.tar.gz

Oh, that indeed works! Wee! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
