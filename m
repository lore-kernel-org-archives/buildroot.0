From: Erik Andersen <andersen@codepoet.org>
Date: Thu, 10 Aug 2006 15:03:05 -0600
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <bf61e79a0608101208v69dfe8ban49e8fd39ec28b19e@mail.gmail.com>
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com>
	<20060810175113.GA20615@codepoet.org>
	<bf61e79a0608101208v69dfe8ban49e8fd39ec28b19e@mail.gmail.com>
Message-ID: <20060810210305.GB22752@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Aug 10, 2006 at 03:08:38PM -0400, Drew Cohan wrote:
> Hotplug:
> 
> wget --passive-ftp -q -P /home/user/buildroot/dl
> http://www.kernel.org/pub/linux/utils/kernel/hotplug//diethotplug-0.4.tar.gz
> zcat /home/user/buildroot/dl/diethotplug-0.4.tar.gz | tar -C

I had a massively reworked version of diethotplug 0.4 hanging
around that a did a few years back for a customer, so I checked
that stuff in instead.  Should fix the problem since it no longer
requires a built and installed kernel source tree to compile, but
instead parses the various *map files at runtime.  Enjoy.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
