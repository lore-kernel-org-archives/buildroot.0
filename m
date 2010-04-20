From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 12:12:37 +0200
Subject: [Buildroot] Missing something. (Error?)
In-Reply-To: <n2of70863321004200258gd67ddb7aveb048b509a438929@mail.gmail.com>
	(Muhammed ER's message of "Tue, 20 Apr 2010 12:58:52 +0300")
References: <q2nf70863321004190259lbcec9a85u99a62dcfc1d332e3@mail.gmail.com>
	<87fx2qbggm.fsf@macbook.be.48ers.dk>
	<n2of70863321004200258gd67ddb7aveb048b509a438929@mail.gmail.com>
Message-ID: <877ho2bffu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Muhammed" == Muhammed ER <er.muhammed@gmail.com> writes:

Hi,

 Peter> Are you really sure you need an objective C compiler? Objc is normally
 Peter> only used by Apple developers.

 Muhammed> I am app. developer. I use Qt for development, but sometimes
 Muhammed> buildroot needs something which is hard to cross compile for
 Muhammed> me (like firmware). Having a toolchain will be good, isn't
 Muhammed> it?

Sure, but you most likely don't need an objective C compiler - Only C
and C++ (for Qt).

 Muhammed>     Are you perhaps looking for C++ support instead?
 Muhammed> Kernel is writen in C, I need at least C. C++ will be better.
 Muhammed> I know, buildroot make a toolchain for me which is
 Muhammed> wonderfull. But cross compile is hardest then normal compile.

Ahh, so you want a C compiler to run on your target? That should work,
but normally isn't such a good idea (performance, lack of automated
rebuild, ..)

-- 
Bye, Peter Korsgaard
