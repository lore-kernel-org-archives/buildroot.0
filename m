From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jul 2009 08:26:38 +0200
Subject: [Buildroot] standard libc libm support
In-Reply-To: <54288.172.16.221.250.1248133430.squirrel@cvs.xtale.biz>
	(nfrench@xtale.biz's message of "Mon\,
	20 Jul 2009 23\:43\:50 -0000 \(Europe\/London\)")
References: <54288.172.16.221.250.1248133430.squirrel@cvs.xtale.biz>
Message-ID: <87d47ueeld.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nfrench" == nfrench  <nfrench@xtale.biz> writes:

Hi,

 nfrench> You are correct it is closed source and linked against
 nfrench> glibc.  Is there no way that buildroot could build this or
 nfrench> am I missing something or have I just overlooked a part of
 nfrench> buildroot, or is it outside the scope of this project.

The only way to use glibc with buildroot is to generate a glibc
toolchain with something like crosstool-ng, and use that as an
external toolchain.

Thomas Petazzoni afaik uses this.

-- 
Bye, Peter Korsgaard
