From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 2 Jul 2008 03:52:37 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb/6.7.1
In-Reply-To: <d6cda7730807012312l2448b678m958b17d5bf2f7541@mail.gmail.com>
References: <20080701214725.7525C3C684@busybox.net>
	<d6cda7730807012312l2448b678m958b17d5bf2f7541@mail.gmail.com>
Message-ID: <d6cda7730807012352q548b6e2aj804f6caf0449ec1a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>    Could you upload the avr32 prepatched gdb 6.7.1 to the at91
> mirror? It's available at the avr32linux.org:
> http://avr32linux.org/twiki/bin/view/Main/GDBPatches
>


Nevermind. I didn't see it before, but it's there. I just had to edit
target/devices/Config.in.toolchain and fix the patch version number.

Sorry for the confusion.
