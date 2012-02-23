From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 23 Feb 2012 15:31:56 -0800
Subject: [Buildroot] Lua and other scripting languages
Message-ID: <CALo-6+ipF1Eqhu92ro+gbsKThou6HEmT97jn57=o3Q7e0y_djA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am working with buildroot and a powerpc 8321 and have a question
about Lua. I can select it and compile it into the rootfs.jffs2, but
when run, it says "lua: table index is Nan" and I am told this has to
do with soft float not being supported in Lua.

Is there a way to get Lua to work in a MPC8323 environment. A follow
on question is if there are any pitfalls to be expected with the other
scripting languages microperl, php, python, tcl or ruby.

-- 
Charles Krinke
