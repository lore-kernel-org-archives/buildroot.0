From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 17:14:58 +0100
Subject: [Buildroot] [PATCH 6/7] pixman: bump to 0.16.4
In-Reply-To: <1263945936-8613-6-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 20 Jan 2010 01:05:35 +0100")
References: <20100119201528.3733.74306.stgit@localhost.localdomain>
	<1263945936-8613-6-git-send-email-llandwerlin@gmail.com>
Message-ID: <87aavynr3x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

I get:

>>>   Patching libtool

Applying buildroot-libtool.patch using plaintext: 
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 5412 (offset 3005 lines).
Hunk #3 FAILED at 2551.
Hunk #4 FAILED at 2895.
Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
Hunk #6 FAILED at 5937.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make: *** [/tmp/br/build/pixman-0.16.4/.stamp_patched] Error 1

-- 
Bye, Peter Korsgaard
