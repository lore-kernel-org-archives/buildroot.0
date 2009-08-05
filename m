From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Aug 2009 15:51:46 +0200
Subject: [Buildroot] Issue using an external toolchain
In-Reply-To: <c8515bdc0908050628h28decb57nd2f7456c61999f40@mail.gmail.com>
	(gilles TALIS's message of "Wed\, 5 Aug 2009 15\:28\:17 +0200")
References: <c8515bdc0908050628h28decb57nd2f7456c61999f40@mail.gmail.com>
Message-ID: <87bpmunzbh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gilles" == gilles TALIS <gilles.talis@gmail.com> writes:

Hi,

 gilles> When I get to the "Welcome to Buildroot" prompt, the login
 gilles> process asks for a password. When I use a toolchain I have
 gilles> built myself using uClibc/crosstool-ng, I am never requested
 gilles> to provide a password.

 gilles> I tried "root", "admin" whatever as password but it does not
 gilles> work.  Can someone help me and also explain to me why I get
 gilles> requested the password now?

Does it really ask for a password or do you just get the login prompt
again? If so, is the external toolchain configured for hard- or
softfloat?

-- 
Bye, Peter Korsgaard
