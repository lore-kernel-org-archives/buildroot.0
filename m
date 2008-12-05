From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Dec 2008 11:37:13 +0100
Subject: [Buildroot] [PATH] adds libusb_0.1.12-13
In-Reply-To: <49366A5C.8020408@walsimou.com> (Gaye Abdoulaye Walsimou's
	message of "Wed\, 03 Dec 2008 12\:15\:40 +0100")
References: <49366A5C.8020408@walsimou.com>
Message-ID: <87myfac3hi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gaye" == Gaye Abdoulaye Walsimou <walsimou@walsimou.com> writes:

 Gaye> Hello list,
 Gaye> without this little path, when you try to add libusb, buildroot will
 Gaye> fail because libusb_0.1.12-12.diff.gz is missing.

Thanks, I changed it in r24282 to use the stable links at
snapshot.debian.net instead so we won't end up with the same problem
again in the future. The newest patch on snapshot is unfortunately
-10, so I had to move back to that one.

-- 
Bye, Peter Korsgaard
