From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 17:34:34 +0200
Subject: [Buildroot] [PATCH] package/brltty: fix cross-compilation
In-Reply-To: <87lg8y3e2x.fsf@home.blind.guru>
References: <20180822082832.7497-1-yann.morin.1998@free.fr>
 <87lg8y3e2x.fsf@home.blind.guru>
Message-ID: <20180822153434.GA2404@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, All,

On 2018-08-22 12:12 +0200, Mario Lang spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > brltty has a very inventive buildsystem, where it internall runs
> > ./configure for the build machine In doing so, it generates a list
> > of make variables to define what the build machine supports, like
> > it does for the target.
[--SNIP--]
> Thanks!  Forwarded to upstream.

I had already sent it upstream, as PR #142, which has siunce been
merged.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
