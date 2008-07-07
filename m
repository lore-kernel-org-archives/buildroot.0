From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 07 Jul 2008 08:09:29 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <d6cda7730807042347s4c4c4f8cw39dd088dd891803@mail.gmail.com>
References: <20080705063720.8C5643C608@busybox.net>
	<d6cda7730807042347s4c4c4f8cw39dd088dd891803@mail.gmail.com>
Message-ID: <1215410969.15257.8.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2008-07-05 at 03:47 -0300, Thiago A. Corr?a wrote:
> AFAIK 4.2.1 is the only gcc release that produces valid binaries.
> 4.2.2 produces C++ programs that crash. I think we shouldn't deprecate
> it.

Huh?

GCC 4.2.2.atmel.1.0.8 + the patches on
http://avr32linux.org/twiki/bin/view/Main/GccPatches is AFAIK more
bugless than 4.2.1.

Do you have an example application which crashes, some stripped C++ code
I can test with.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
