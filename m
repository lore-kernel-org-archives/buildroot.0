From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 23:18:32 +0100
Subject: [Buildroot] [PATCH 5 of 5 v6] dependencies: build a host-tar if
	no suitable tar can be found
In-Reply-To: <ffdbaa3cbd40c88e77d8.1328718140@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 08 Feb 2012 17:22:20 +0100")
References: <patchbomb.1328718135@beantl019720>
 <ffdbaa3cbd40c88e77d8.1328718140@beantl019720>
Message-ID: <87mx8r3b2f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Some toolchains, like the one built with buildroot itself, use
 Thomas> hardlinks (for example to link between the c++ and g++
 Thomas> binary). Unpacking such a toolchain with the --strip-components
 Thomas> options does not work correctly if the system tar is too old
 Thomas> (<1.17). Even recent releases of RedHat/CentOS still ship with
 Thomas> tar 1.15.

Committed, thanks.

-- 
Bye, Peter Korsgaard
