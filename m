From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 14:32:27 +0200
Subject: [Buildroot] [PATCHv2] argus: bump to vanilla version 3.6.0.1
In-Reply-To: <1403027700-14160-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 17 Jun 2014 14:55:00 -0300")
References: <1403027700-14160-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bntq2yas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > All of the new toolchain requirements (ipv6, threads, rpc) aren't
 > actually new - this package failed to build for ages, it just wasn't
 > picked up by the autobuilders because the main Makefile just doesn't
 > care about bailing out properly.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
