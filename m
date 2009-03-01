From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Mar 2009 07:43:24 +0100
Subject: [Buildroot] buildbot infrastructure
In-Reply-To: <608983.59657.qm@web56904.mail.re3.yahoo.com> (Frank Hoeflich's
	message of "Sat\, 28 Feb 2009 16\:04\:39 -0800 \(PST\)")
References: <608983.59657.qm@web56904.mail.re3.yahoo.com>
Message-ID: <871vthlp4j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hoeflich <frankhoeflich@yahoo.com> writes:

 Frank> Peter:

 Frank>     Actually I was hunting for any BR support for the next
 Frank>     step - kicking off an automated test cycle after a config
 Frank>     builds correctly.  If that doesn't exist yet (and no one
 Frank>     else has claimed this turf), I'll go off into a corner and
 Frank>     figure out how to write something for buildbot.

It would be interesting if we could check the following per package:
 - That all binaries/libs are stripped
 - That they are for the correct architecture
 - That the clean target removes everything again (do a find
   $(TARGET_DIR) before and after and diff

-- 
Bye, Peter Korsgaard
