From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 13:42:10 +0100
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <49941678.4040902@cetrtapot.si> (Hinko Kocevar's message of "Thu\,
	12 Feb 2009 13\:30\:48 +0100")
References: <87skmkf1s0.fsf@macbook.be.48ers.dk>
	<49941678.4040902@cetrtapot.si>
Message-ID: <87ocx7g731.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:

Hi,

 Hinko> Building gdb for cris-v10 architecture fails with:

Ahh, seems like you should have tested the release candidates better
;)

 Hinko> make: *** [/work/uclibc.buildroot/buildroot-2009.02/build_cris/gdb-6.8-target/gdb/gdb] Error 2

 Hinko> Are we missing uclibc config.guess and config.sub?

No, gdk.mk does the CONFIG_UPDATE stuff, and
package/gnuconfig/config.guess seems to have have the cris entries.

-- 
Bye, Peter Korsgaard
