From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 16:32:53 +0100
Subject: [Buildroot] [PATCH v2] package/mutt: add security fixes from
 Ubuntu for CVE-2021-3181
In-Reply-To: <20210128204940.19495-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Jan 2021 21:49:40 +0100")
References: <20210128204940.19495-1-peter@korsgaard.com>
Message-ID: <87y2gasamy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-3181: rfc822.c in Mutt through 2.0.4 allows remote attackers to
 >   cause a denial of service (mailbox unavailability) by sending email
 >   messages with sequences of semicolon characters in RFC822 address fields
 >   (aka terminators of empty groups).  A small email message from the
 >   attacker can cause large memory consumption, and the victim may then be
 >   unable to see email messages from other persons.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
