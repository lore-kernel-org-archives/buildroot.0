From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 21:16:41 +0100
Subject: [Buildroot] [PATCH 4/7] package/libedit2: new package
In-Reply-To: <5112B007.4080705@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <201302062017.07747.yann.morin.1998@free.fr> <5112B007.4080705@mind.be>
Message-ID: <201302062116.42055.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Wednesday 06 February 2013 Arnout Vandecappelle wrote:
> On 06/02/13 20:17, Yann E. MORIN wrote:
> > $ ls -l target/usr/lib/libedit*
> > lrwxrwxrwx 1 ymorin ymorin     12 Feb  6 20:09 target/usr/lib/libedit.so -> libedit.so.2
> > lrwxrwxrwx 1 ymorin ymorin     15 Feb  6 20:09 target/usr/lib/libedit.so.2 -> libedit.so.2.11
> > -rw-r--r-- 1 ymorin ymorin 135945 Feb  6 20:09 target/usr/lib/libedit.so.2.11
>   Hang on... Aren't these links created by ldconfig? Is it even necessary 
> to create them manually, since we run ldconfig in target-finalize?

Just tried. Nice catch! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
