From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 28 May 2010 22:20:50 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <1274997359.436.32.camel@ubuntu>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<201005272315.11295.yann.morin.1998@anciens.enib.fr>
	<1274997359.436.32.camel@ubuntu>
Message-ID: <201005282220.50730.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kris, All,

On Thursday 27 May 2010 23:55:59 Microbit_Ubuntu wrote:
> On Thu, 2010-05-27 at 23:15 +0200, Yann E. MORIN wrote:
> > libthread_db.so.1 is dlopen(3)ed by gdbserver, so you have to get it on
> > your target, in the standard libraries search path.
> When gdbserver was bleating about libthread_db.so.1, it was in the staging directory,
> but it wasn't placed on the target rootfs.
> When I manually added it on the target (libthread_db.so.1 I mean), gdbserver worked good as gold then...

I've just submitted a fix for this:
  http://lists.busybox.net/pipermail/buildroot/2010-May/034848.html

Care to test it and report, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
