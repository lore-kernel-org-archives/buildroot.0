From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 20:09:28 +0200
Subject: [Buildroot] [PATCH] lvm2: fix m68k build error
In-Reply-To: <20160703165617.GA27285@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 3 Jul 2016 18:56:17 +0200")
References: <20160703165617.GA27285@waldemar-brodkorb.de>
Message-ID: <87a8hypp9j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Disable PIE for m68k as it is not supported.
 > Fixes following autobuild failures:
 > http://autobuild.buildroot.net/results/2f976292ddbb8eddb58cc978f209f4f445b5b756/
 > http://autobuild.buildroot.net/results/7a2b1eef06004886be28744bf1c53d027f8d0123/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
