From: Heiko Helmle <helman@gmx.net>
Date: Wed, 31 Aug 2011 19:49:33 +0200
Subject: [Buildroot] Linux kernel hangs after boot without any error!
In-Reply-To: <878vqaoa2j.fsf@macbook.be.48ers.dk>
References: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
 <201108300545.59774.minimod@morethan.org>
 <DEB91A26-9E37-4C94-99DF-72B324C6A23B@gmx.net>
 <878vqaoa2j.fsf@macbook.be.48ers.dk>
Message-ID: <8C0B964A-1384-4633-87FB-7F3BD4663D90@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 30.08.2011 um 23:37 schrieb Peter Korsgaard:

>>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:
> 
> Hi,
> 
> Heiko> Just a thought - would it hurt much to start a getty on tty1 by
> Heiko> default? at least on x86?
> 
> We used to do that, but it has the disadvantage that the console gets
> spewed with lots of errors about getty failing when you don't have a
> tty1 (E.G. for the fairly common case of no framebuffer console support
> in the kernel).

Hmm... maybe a switch in menuconfig "Getty on vt1" - kind of an easy mode. I'm guessing most beginners start like me, compiling a buildroot system with all defaults, launching it in qemu and then wondering why there's no login.
