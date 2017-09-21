From: mikmik <asaf_ca@walla.com>
Date: Wed, 20 Sep 2017 23:22:19 -0700 (MST)
Subject: [Buildroot] Change CFLAGS for a certain package
Message-ID: <1505974939125-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a generic-package 'hello' contains hello.c and Makefile.
In the mk file I want to build HELLO_CONFIGURE_OPTS just as
TARGET_CONFIGURE_OPTS but change only CFLAGS to my desired CFLAGS for hello
(say just '-g').

Right now, I used sed on TARGET_CONFIGURE_OPTS and replaced CFLAGS. It
works.
But there isn't a more easy or intuitive way to replace some variables on
TARGET_CONFIGURE_OPTS?

Thanks in advance.




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
