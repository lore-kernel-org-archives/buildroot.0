From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 12 Feb 2007 09:07:29 +0100
Subject: [Buildroot] Problem building build root in a squashhfs image
In-Reply-To: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
References: <12d878080702111341q1b2b9468w53aff97f6c6ccb0c@mail.gmail.com>
Message-ID: <20070212090729.58cf28f0.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I Have been trying to compile buildroot, but i keep getting stuck on the
> following error:
> 
> make: *** No rule to make target
> `/usr/src/buildroot/build_i586/linux-2.6.12/.patched',
> needed by `/usr/src/buildroot/build_i586/linux- 2.6.12/.configured'.  Stop.

Hi,

If you copy-paste the error in the mail, then it's certainly due to the
space character.

Otherwise, check the linux.mk makefile.

Philippe
