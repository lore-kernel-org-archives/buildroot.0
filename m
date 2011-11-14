From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Nov 2011 16:22:04 +0100
Subject: [Buildroot] [PATCH 2 of 2] linux: make vmlinux target available
	to all architectures
In-Reply-To: <154480348720d8530ebf.1316587576@localhost6.localdomain6> (Thomas
 De Schampheleire's message of "Wed, 21 Sep 2011 08:46:16 +0200")
References: <patchbomb.1316587574@localhost6.localdomain6>
 <154480348720d8530ebf.1316587576@localhost6.localdomain6>
Message-ID: <87pqgun2zn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The 'vmlinux' target in the linux build directory is a generic
 Thomas> target. It may not be directly bootable for all architectures,
 Thomas> but for projects where a custom bootloader is used, it can be
 Thomas> of value.

Committed, thanks.

-- 
Bye, Peter Korsgaard
