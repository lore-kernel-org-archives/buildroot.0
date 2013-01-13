From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 20:21:07 +0100
Subject: [Buildroot] [PATCH 1/1] cairo graphics bump version to 1.12.8
	and drop patch
In-Reply-To: <1355956942-30228-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Wed, 19 Dec 2012 23:42:22 +0100")
References: <1355956942-30228-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87obgsyjmk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Committed with some changes, thanks.

Cairo has gained script and xml backends, so I've added config options
for these. The X backend can also use libXrender, so I've fixed that
while I was at it.

-- 
Bye, Peter Korsgaard
