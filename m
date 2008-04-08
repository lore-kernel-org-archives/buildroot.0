From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2008 20:59:02 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
In-Reply-To: <20080408174730.2CAEB3C379@busybox.net> (nkukard@uclibc.org's
	message of "Tue\, 8 Apr 2008 10\:47\:30 -0700 \(PDT\)")
References: <20080408174730.2CAEB3C379@busybox.net>
Message-ID: <87abk4i361.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nkukard" == nkukard  <nkukard@uclibc.org> writes:

 nkukard> Author: nkukard
 nkukard> Date: 2008-04-08 10:47:29 -0700 (Tue, 08 Apr 2008)
 nkukard> New Revision: 21673

 nkukard> Log:
 nkukard> * Generate keys for dropbear only when starting

 nkukard> * Generate keys silently

Is that good? Generating keys takes a LONG time on most embedded
systems, so having a bit of feedback would be good.

 nkukard> Modified:
 nkukard>    trunk/buildroot/package/dropbear/dropbear-init.patch

Having this init script as a patch is kinda silly, let's simply add it
under package/dropbear and copy it over to TARGET_DIR, E.G. like it's
done for avahi.

(Yes, I know you didn't add the patch in the first place).

-- 
Bye, Peter Korsgaard
