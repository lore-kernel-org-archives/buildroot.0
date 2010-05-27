From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 27 May 2010 23:19:54 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released uClibc 0.9.30.1
	patches missing ?
In-Reply-To: <1274994677.436.2.camel@ubuntu>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1274994677.436.2.camel@ubuntu>
Message-ID: <201005272319.54338.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kris, All,

On Thursday 27 May 2010 23:11:17 Microbit_Ubuntu wrote:
> I don;t know if I'm off base here, but I notice that rc3 does not have
> the patches for uClibc 0.9.30.1 at toolchain/uClibc folder in the
> tarball ?????

Indeed, that because the 0.9.30.x that is used is .3, and .1 is not present
in the version choice, in the menuconfig. See:
  toolchain/uClibc/Config.in at 40

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
