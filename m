From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:28:36 +0200
Subject: [Buildroot] [PATCH 4/4] package/linux-headers: drop support for
 5.x headers
In-Reply-To: <20190618115733.28551-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 18 Jun 2019 13:57:33 +0200")
References: <20190618115733.28551-1-peter@korsgaard.com>
 <20190618115733.28551-4-peter@korsgaard.com>
Message-ID: <87a7eca42j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The 5.0.x series is now EOL and vulnerable to the "TCP SACK PANIC" issue.
 > Drop support for it in linux-headers.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
