From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 25 Jul 2012 10:02:56 -0700
Subject: [Buildroot] opengl
Message-ID: <CALo-6+jTYZCiEz8zApGC20xo=zgMOfM0wTakoRV4=dVBgp6oCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a question about opengl and Qt in working with a TI AM3517EVM.
I can compile and run Qt, no problem, with buildroot, but my
application guy says opengl will speed up rendering.

In looking at make xconfig, I see that libevas, the Enlightment
libraries have a opengl sub-setting, which is grayed out. It looks
like this depends on X11.

My question is "Is there a way to use opengl wtih Qt with buildroot
and a) how does opengl connect logically with Qt and b) How to enable
opengl so Qt can use it?"

-- 
Charles Krinke
