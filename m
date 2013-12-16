From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 22:07:36 +0100
Subject: [Buildroot] [PATCH 1/1] linux.mk: enable options for ktap
In-Reply-To: <1387191200-20387-1-git-send-email-anders@chargestorm.se> (Anders
 Darander's message of "Mon, 16 Dec 2013 11:53:20 +0100")
References: <1387191200-20387-1-git-send-email-anders@chargestorm.se>
Message-ID: <87k3f4qzc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders@chargestorm.se> writes:

 > Certain tracing related options are required to be able to build
 > ktapvm.ko, enable those.  Enable CONFIG_FUNTCTION_TRACER as
 > otherwise, CONFIG_EVENT_TRACING won't stick. (Some tracer needs to be
 > enabled for this).

 > Signed-off-by: Anders Darander <anders@chargestorm.se>
 > ---

Committed, thanks.

-- 
Bye, Peter Korsgaard
