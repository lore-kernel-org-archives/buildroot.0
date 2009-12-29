From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Dec 2009 21:26:09 +0100
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <99c29bc6a922cbb004b34bdc010362dd.squirrel@webmail.sonic.net>
	(joyful@sonic.net's message of "Mon, 28 Dec 2009 21:59:59 -0800")
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
	<62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
	<87fx73xxrk.fsf@macbook.be.48ers.dk>
	<e14e708720ddfeae76da70a20047b110.squirrel@webmail.sonic.net>
	<877hsdwchq.fsf@macbook.be.48ers.dk>
	<ca97c59d98e2891cf752ddf02b2de681.squirrel@webmail.sonic.net>
	<99c29bc6a922cbb004b34bdc010362dd.squirrel@webmail.sonic.net>
Message-ID: <87hbr9v866.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "joyful" == joyful  <joyful@sonic.net> writes:

Hi,

 joyful> I selected few more package and build root gave more errors:

 >>>> rsync 3.0.6 Building
 joyful> PATH="/tmp/buildroot/output/toolchain/bin:/tmp/buildroot/output/host/bin:/tmp/buildroot/output/host/usr/bin:/tmp/buildroot/output/st
 joyful> aging/bin:/tmp/buildroot/output/staging/usr/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/data/dnsmux2/bin"
 joyful> /usr/bin/make -j1 -C /tmp/buildroot/output/build/rsync-3.0.6/
 joyful> make[1]: Entering directory
 joyful> `/tmp/buildroot/output/build/rsync-3.0.6' In file included from
 joyful> ./rsync.h:886, from ./rounding.c:20: ./lib/addrinfo.h:141:
 joyful> error: redefinition of 'struct sockaddr_storage' Failed to
 joyful> create rounding.h!  make[1]: *** [rounding.h] Error 1 make[1]:
 joyful> Leaving directory `/tmp/buildroot/output/build/rsync-3.0.6'
 joyful> make: ***
 joyful> [/tmp/buildroot/output/build/rsync-3.0.6/.stamp_built] Error 2

Please post your .config. Rsync builds here on powerpc and ARM without
any problems.

 joyful> I also ran into error when I try to include the latest
 joyful> bind-9.7.0rc1 to build both the named and bind-lib.  I found an
 joyful> old bind.mk that build both named and bind_lib, but that always
 joyful> fail, too.

What error did you run into?

-- 
Bye, Peter Korsgaard
