From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 10:34:43 +0100
Subject: [Buildroot] [PATCH] exim: security bump to 4.87.1
In-Reply-To: <20161225223815.3970-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 25 Dec 2016 23:38:15 +0100")
References: <20161225223815.3970-1-peter@korsgaard.com>
Message-ID: <87vau5d8b0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > No features are added or removed. This release contains
 > just a fix for CVE-2016-9963

 >     - Fix CVE-2016-9963 - Info leak from DKIM.  When signing DKIM, if
 >       either LMTP or PRDR was used for delivery, the key could appear in
 >       logs.  Additionally, if the experimental feature "DSN_INFO" was used,
 >       it could appear in DSN messages (and be sent offsite).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
