From: iks hefem <ikshefem@gmail.com>
Date: Wed, 14 Feb 2007 17:57:04 +0100
Subject: [Buildroot]  llrint not defined in uClibC ? please help
Message-ID: <78e18a710702140857v2f2d92a2odcdfc0cb94fa3f29@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I'm trying to integrate ffmpeg to buildroot, however I have a big
problem : I cannot find why the llrint function is not found (and not
exported by libm in uClibc, I checked with an objdump)

could you help me find the solution ? Shall I send this to uClibC ML ?

here is the extract :

audiodec.c:410: undefined reference to `llrint'
collect2: ld returned 1 exit status

(this with snapshot uClibc, gcc 4.2 compiling from x86_64 to i686)

thanks !
