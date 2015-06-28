From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 22:49:12 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <20150628204622.GE3950@free.fr>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr>
Message-ID: <20150628204912.GF3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-06-28 22:46 +0200, Yann E. MORIN spake thusly:
> On 2015-06-28 21:42 +0200, Fabio Porcedda spake thusly:
[--SNIP--]
> > |  35GB |  99m | master branch
> > |  37GB | 100m | patch set             
> > | 153GB | 105m | patch set using hard links only for the toolchain sysroot
> > | 225GB | 106m | patch set not using hardlinks at all
[--SNIP--]
>   - the size overhead is huge, a factor 4.4 with hardlinks, 6.5 without
>     hardlinks

Oh wait, I read the wrong line...

OK, disregard my comments about the size overhead. It's only 2GiB, i.e.
roughly 5%.

Sorry for the confusion...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
