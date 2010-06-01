From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 1 Jun 2010 22:27:12 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <1275423717.2578.5.camel@ubuntu>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<201005282220.50730.yann.morin.1998@anciens.enib.fr>
	<1275423717.2578.5.camel@ubuntu>
Message-ID: <201006012227.12730.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kris, All,

On Tuesday 01 June 2010 22:21:57 Microbit_Ubuntu wrote:
> FYI, strace now does show the proper lib call (naturally :-) :
> # strace gdbserver
> execve("/usr/bin/gdbserver", ["gdbserver"], [/* 16 vars */]) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x40005000
> open("/lib/libthread_db.so.1", O_RDONLY) = 3
> fstat(3, {st_mode=S_IFREG|0755, [SNIP].... etc....

Good, then! Thanks for reporting success! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
