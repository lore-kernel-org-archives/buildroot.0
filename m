From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Mar 2012 13:59:56 +0100
Subject: [Buildroot] [PATCH] New package: parted
In-Reply-To: <1331547844-23763-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 12 Mar 2012 11:24:04
 +0100")
References: <1331547844-23763-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87k42olkqb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, but it needs to depend on largefile + wchar, as lvm2 /
util-linux needs those.

I've fixed that up and committed, thanks.

-- 
Bye, Peter Korsgaard
