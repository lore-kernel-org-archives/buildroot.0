From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Dec 2013 21:29:40 +0100
Subject: [Buildroot] [PATCH 1/1] ktap: update to v0.4
In-Reply-To: <1387393023-16782-1-git-send-email-anders@chargestorm.se> (Anders
 Darander's message of "Wed, 18 Dec 2013 19:57:03 +0100")
References: <1387393023-16782-1-git-send-email-anders@chargestorm.se>
Message-ID: <87sitomvnv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:

 > Add a check for BR2_PACKAGE_ELFUTILS; if this is enabled, then try to
 > link against libelf from the elfutils package. This allows ktap to
 > resolve symbols in userspace.

 > The new FFI functionality in ktap is not exposed, as it currently
 > only supports x86_64...

Nit: please wrap your commit text so it displays on a 80 col screen
without scrolling.

 > Signed-off-by: Anders Darander <anders@chargestorm.se>

Committed, thanks.

-- 
Bye, Peter Korsgaard
