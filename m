From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 00:09:23 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E76775.8030200@mind.be>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <55E76348.3020509@mind.be> <55E76775.8030200@mind.be>
Message-ID: <20150902220923.GD7845@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-02 23:17 +0200, Arnout Vandecappelle spake thusly:
> On 02-09-15 22:59, Arnout Vandecappelle wrote:
> > On 02-09-15 00:55, Yann E. MORIN wrote:
> >> systemd is incresaingly expected things to live in /usr/bin or
> >> /usr/sbin.
> >>
> >> However, a lot of packages stil install stuff directly into /bin or
> >> /sbin.
> >>
> >> Add an option so that /bin and /sbin be symlinks to /usr/bin and
> >> /usr/sbin. Ditto for .lib for consistency.
> 
>  One more thing: it would be good to mention explicitly in the commit log that
> /lib64 (or /lib32 or /libx32) doesn't need to be handled because that is already
> a symlink to lib.

Yeah, I almost mentionned them, but refrained from doing so, as I thought
it was already well-known that they were synlinks already.

But I'll add this before I resubmit.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
