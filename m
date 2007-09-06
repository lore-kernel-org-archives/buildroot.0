From: Micha Nelissen <micha@neli.hopto.org>
Date: Thu, 06 Sep 2007 18:06:34 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
In-Reply-To: <20070906071019.GA2168@z1.synertronixx>
References: <fbkjea$tfd$1@sea.gmane.org>
	<20070906071019.GA2168@z1.synertronixx>
Message-ID: <fbp8l4$rtg$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Konstantin Kletschke wrote:
> Is armeb the same like arm-linux-uclibcgnueabi-gcc (i.e. EABI with
> softfloat in my exact case, gcc-4.2.1 uClibc-0.9.29)?

armeb = arm big endian. I'm using OABI btw; does that matter? Would
using EABI resolve those floating point routine linker errors? EABI is
about the kernel interface, so my guess was no.

Micha
