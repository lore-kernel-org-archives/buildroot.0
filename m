From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 16:38:25 +0200
Subject: [Buildroot] Simple glibc-based external toolchain support
In-Reply-To: <20090415162319.757eadd8@surf> (Thomas Petazzoni's message of
	"Wed\, 15 Apr 2009 16\:23\:19 +0200")
References: <20090413221219.0819d500@surf> <20090415160314.1de1229f@surf>
	<87zleivwbi.fsf@macbook.be.48ers.dk> <20090415162319.757eadd8@surf>
Message-ID: <87r5zuvv6m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> This raises the following point: do we need these options at
 Thomas> all ?  Can't we just hardcode in ext-took.mk the list of
 Thomas> libraries that have to be imported in the target, depending
 Thomas> on the choosen C library ?

Sure, if the value is the same for all library versions, with/without
tls/ntpl, endianness, abi, ..

Alternatively we could add 3 options: uclibc, glibc and custom, and
then only display the setting for custom.

-- 
Bye, Peter Korsgaard
