From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2012 14:49:29 +0100
Subject: [Buildroot] first things first for a newbie
In-Reply-To: <CAPEB33zWQevjj3qs0C6x4POw1qjgByXDSwAxaGdh7VEJ47wn6A@mail.gmail.com>
References: <CAPEB33x-LxCP9mz0hhH6dr5-Hftke3EjNLyVMt4s7kfd_0cCiw@mail.gmail.com>
 <20120128224534.4787e302@skate>
 <CAPEB33zWQevjj3qs0C6x4POw1qjgByXDSwAxaGdh7VEJ47wn6A@mail.gmail.com>
Message-ID: <20120129144929.41aeb832@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[ Please don't reply to me directly: keep the list in Cc ]

Le Sun, 29 Jan 2012 13:34:03 +0000,
MERCADIER Johann <johann.mercadier@imerir.com> a ?crit :

>    I just registered into IRC channel as JoM. The Doc/manual does'nt
> answer to my problem they look much more as guidelines. By the way I
> got the following problem while creating the manual:
> "
> $ make manual
> Generating HTML manual...
> /bin/bash: a2x: command not found
> make: *** [output/docs/manual/manual.html] Error 127
> "
> if you already have faced out such a mistake?

Could you read the error message? It says:

  a2x: command not found

So it means that the a2x command is not available on your system, and
that you must install it. You have to install the 'asciidoc' package,
which contains the necessary utilities to compile the Buildroot
documentation.

> TC stand for Tool Chain

Ok. This is not a very common acronym.

>    Sorry about that my mistake was to have created a HOST_DIR called
> 'target'... Please say nothing...So I modify that to call it
> 'workdone' til know everything work fine all options for GDB have
> been compiled out.
> 
>    Will proceed with the creation of a defconfig for the pandaboard.
> 
>    I noticed that no config file does exist for this board does it
> mean that every person who want to use it has to do those steps
> before using it? or it is mainly dependant of the buildroot version?

A Pandaboard defconfig file was submitted some time ago, but hasn't
been integrated into Buildroot (due to lack of time of the maintainer
at the moment), but it would definitely be great to have one. You can
search in the mailing list archives for the patch adding the Pandaboard
defconfig file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
