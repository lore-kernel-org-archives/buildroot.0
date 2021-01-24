From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 16:28:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/sysklogd: bump to verson 2.2.0
In-Reply-To: <87zh0yuzpy.fsf@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
 <20210122154333.1927190-2-troglobit@gmail.com>
 <20210124093641.GJ926565@scaer> <87zh0yuzpy.fsf@gmail.com>
Message-ID: <20210124152831.GA2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All

On 2021-01-24 16:22 +0100, Joachim Wiberg spake thusly:
> I apologize for the confusion and head scratching this has caused!

No need for an apology ;-)

> I see, for past sysklogd that worked.  Now we provide the logger tool
> as well, and --exec-prefix=/ changes to /bin/logger and /sbin/syslogd.
> Since BusyBox logger is in /usr/bin,

Ah, this is the kind of explanations that should go in a commit message!

Indeed, a commit message that just describes the changes is not very
helpful. What is important in a commit message is to explain what the
problem is and why the change fixes it.

> I believe we need to change the
> SYSKLOGD_CONF_OPTS to use --bindir and --sbindir instead.
> I'll post another patch shortly.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
