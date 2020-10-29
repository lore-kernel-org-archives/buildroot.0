From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2020 13:57:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: fix uclibc build
In-Reply-To: <20201029071500.GL2805@scaer>
References: <20201025164108.1837152-1-fontaine.fabrice@gmail.com>
 <20201029071500.GL2805@scaer>
Message-ID: <20201029125703.GM2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-29 08:15 +0100, Yann E. MORIN spake thusly:
> On 2020-10-25 17:41 +0100, Fabrice Fontaine spake thusly:
> > Fix build of sshfs 3.7.0 with uclibc
[--SNIP--]
> > +[Retrieved from:
> > +https://github.com/libfuse/sshfs/pull/221/commits/7315b0c2f7e04353fefb9734da60884e9b382e51]
> Not sure if you followed up on that PR, but there has been some recent
> activity, and the issue is in fact probably with libfuse itself:
> 
>     https://github.com/libfuse/libfuse/pull/556

This libfuse PR has now been merged, so I guess we can now backport the
libfuse upstream commit:
https://github.com/libfuse/libfuse/commit/4ebb018e78b53a8afe0368e7cd7a17a67c52e3df

Care to do send the patch, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
