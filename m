From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 12:48:39 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <20171126152140.0fd3902b@windsurf.home>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
Message-ID: <20171127114839.GE2950@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-26 15:21 +0100, Thomas Petazzoni spake thusly:
> >          arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/7c9892b9425aff6e54b8c8942dbdcb0b26e58572 | ORPH
> /usr/bin/install: cannot create regular file `/home/peko/autobuild/instance-1/output/target/usr/lib/asterisk/modules': No such file or directory

PArallel build issue: destination directory is created in another rule,
and there is not explicit dependency.

I'll fix and report upstream.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
