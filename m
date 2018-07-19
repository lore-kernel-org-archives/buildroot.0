From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:44:13 +0200
Subject: [Buildroot] [PATCH 1/1] <wireless-regdb>: Adds
 "regulatory.db[.p7s]" to /lib/firmware
In-Reply-To: <20180716151303.18064-1-me@noctarius.com> (Christoph Engelbert's
 message of "Mon, 16 Jul 2018 18:13:03 +0300")
References: <20180716151303.18064-1-me@noctarius.com>
Message-ID: <87lga6aok2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christoph" == Christoph Engelbert <me@noctarius.com> writes:

 > With kernel version 4.15, Linux started to support loading regulatory.db and regulatory.db.p7s files
 > directly from /lib/firmware, without the need of crda. If the kernel can't load those files it'll
 > fallback to using crda, but the direct way is preferred.

 > This patch copies those those files under /lib/firmware. The use of crda shouldn't be necessary with
 > kernels of 4.15 or later.

 > Signed-off-by: Christoph Engelbert <me@noctarius.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
