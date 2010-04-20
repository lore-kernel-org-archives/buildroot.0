From: Ben Kloosterman <bklooste@gmail.com>
Date: Tue, 20 Apr 2010 20:19:19 +0800
Subject: [Buildroot] question on config.cache
In-Reply-To: <mailman.0.1271765550.25465.buildroot@busybox.net>
References: <mailman.0.1271765550.25465.buildroot@busybox.net>
Message-ID: <025e01cae083$b5eebca0$21cc35e0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Im trying to crosscompile mono on i386 + uclib (without mmu)  and have
created a package and after a few things I fixed I now get stuck on 

"checking for preceding underscore symbols"    then the cannot run prog
message. 

I found you should/can set the mono_cv_sizeof_sunpath  and mono_cv_uscore
config cache options but how exactly do I do this in buildroot  ?  I tried
some echos in the mono.mk file but they were just ignored.  Im using a basic
autoconfig mk file.

Regards, 

Ben Kloosterman
