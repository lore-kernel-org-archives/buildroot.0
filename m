From: salorob <r.salomons@ropesolutions.nl>
Date: Tue, 7 Jul 2015 23:28:00 -0700 (PDT)
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
Message-ID: <1436336880640-104945.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm struggling to get mono build in Buildroot. I 'took' the mono and the
moonlight packages in https://github.com/maximeh.

I already tried a million different things. (different gcc version,
different gettext, trying to build on ubuntu/debian) but it all comes down
to this error after a while:


What can i do to get to the bottom of this ?

If i go into the build/mono directory manually, and issue a .configure and
make there, it compiles without errors.

Is there something in the config not right ?

*package/mono/mono.mk:*



*uname -r and gcc -v:*


Kind regard, many thanks!



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-Mono-Compile-fails-on-mscorlib-tp104945.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
