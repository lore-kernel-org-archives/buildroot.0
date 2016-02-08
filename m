From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 18:32:41 +0100
Subject: [Buildroot] [PATCH 1/1] fix typo for libilclient.so on target
In-Reply-To: <20160208162945.3a76ee76@free-electrons.com>
References: <1454944884-49410-1-git-send-email-michael.schenk@albistechnologies.com>
 <20160208162945.3a76ee76@free-electrons.com>
Message-ID: <20160208173241.GC3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Michael, All,

On 2016-02-08 16:29 +0100, Thomas Petazzoni spake thusly:
> On Mon, 8 Feb 2016 16:21:24 +0100, Schenk, Michael wrote:
> > Signed-off-by: Schenk, Michael <michael.schenk@albistechnologies.com>
> > ---
> >  package/rpi-userland/rpi-userland.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks, I've applied after tweaking two things:
[--SNIP--]
>  - The author/SoB lines, where for consistency reasons we prefer to
>    have the first name before the last name. Yes, I know that depending
>    on your geographical area, the common way of doing this is
>    different, but Buildroot Git history uses "FirstName LastName
>    <email>" everywhere, so I've changed this. If you can change your
>    Git configuration to use this for future patches, it would be great.

I beg to disagree here. I amongst all would prefer we do not force
people to identify one way or another. We should *really* let people
identify the way *they* want to.

Thank you.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
