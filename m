From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 20:49:52 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
In-Reply-To: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
References: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
Message-ID: <20180606204952.58f73809@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jun 2018 17:41:53 +0200, Michele Bucca wrote:

> My host system is Debian Jessie 8.10 x86_64
> I attach my .config file: what can I do to fix the iissue?

Is this what you have after a complete rebuild ? Make sure you have the
same error after doing "make clean; make".

See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
