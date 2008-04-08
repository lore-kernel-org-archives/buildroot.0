From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2008 21:32:10 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
In-Reply-To: <1207682242.6817.277.camel@nigel-x60> (Nigel Kukard's message of
	"Tue\, 08 Apr 2008 19\:17\:22 +0000")
References: <20080408174730.2CAEB3C379@busybox.net>
	<87abk4i361.fsf@macbook.be.48ers.dk>
	<1207682242.6817.277.camel@nigel-x60>
Message-ID: <87zls4gn2d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 >> Is that good? Generating keys takes a LONG time on most embedded
 >> systems, so having a bit of feedback would be good.

 Nigel> I can add something about generating keys on the same line?

 Nigel> Staring dropbear sshd: generating host keys...OK

 Nigel> how does that look? normal startup would be...

 Nigel> Starting dropbear sshd: OK

Sounds good.

 nkukard> Modified:
 nkukard> trunk/buildroot/package/dropbear/dropbear-init.patch
 >> 
 >> Having this init script as a patch is kinda silly, let's simply add it
 >> under package/dropbear and copy it over to TARGET_DIR, E.G. like it's
 >> done for avahi.
 >> 
 >> (Yes, I know you didn't add the patch in the first place).

 Nigel> Duly noted, will add in my next commit together with a fix for the
 Nigel> above.

Great!

-- 
Bye, Peter Korsgaard
