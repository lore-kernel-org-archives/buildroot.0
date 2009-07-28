From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jul 2009 23:10:10 +0200
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <4A6EE8F1.3060302@tandberg.com> (Chris Smith's message of "Tue\,
	28 Jul 2009 13\:02\:57 +0100")
References: <4A6EE8F1.3060302@tandberg.com>
Message-ID: <87y6q8jyz1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Smith <chris.smith@tandberg.com> writes:

hi,

 Chris> When I build netsnmp the built snmpd doesn't work on the
 Chris> target.  All the other snmp stuff works but I get lib.so.6 not
 Chris> found when trying to run snmpd.

Sure that's 'lib.so.6'? That's a fairly strange library name.

 Chris> Anyone have any thoughts?  It is as if some linkage to host
 Chris> based libraries has crept in.

What arch are you building for?

What does build_*/staging_dir/*-readelf -x <snmpd> | grep NEEDED give?

-- 
Bye, Peter Korsgaard
