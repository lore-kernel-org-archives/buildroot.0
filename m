From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 23:04:35 +0100
Subject: [Buildroot] [PATCH] mosquitto: security bump to version 1.4.15
In-Reply-To: <20180228231140.7660-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 1 Mar 2018 00:11:40 +0100")
References: <20180228231140.7660-1-peter@korsgaard.com>
Message-ID: <87606fh2q4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7651: Unauthenticated clients can send a crafted CONNECT
 > packet which causes large amounts of memory use in the broker.  If multiple
 > clients do this, an out of memory situation can occur and the system may
 > become unresponsive or the broker will be killed by the operating system.

 > The fix addresses the problem by limiting the permissible size for CONNECT
 > packet, and by adding a memory_limit configuration option that allows the
 > broker to self limit the amount of memory it uses.

 > The hash of new tarball is not (yet) available through download.php, so use
 > a locally calculated hash.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
