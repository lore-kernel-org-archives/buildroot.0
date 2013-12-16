From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 22:39:38 +0100
Subject: [Buildroot] [PATCH] Add hypervisor consoles (hvc)
In-Reply-To: <20131216161314.3b13c9e4@kryten> (Anton Blanchard's message of
 "Mon, 16 Dec 2013 16:13:14 +1100")
References: <20131216161314.3b13c9e4@kryten>
Message-ID: <877gb4qxut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Blanchard <anton@samba.org> writes:

 > Add /dev/hvc* devices, and add them to securetty. These
 > are required for ppc64 virtual consoles.

 > Signed-off-by: Anton Blanchard <anton@samba.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
