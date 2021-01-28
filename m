From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:46:52 +0100
Subject: [Buildroot] [PATCH] package/mutt: add security fixed from
 Ubuntu for CVE-2021-3181
In-Reply-To: <20210128204432.18437-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Jan 2021 21:44:32 +0100")
References: <20210128204432.18437-1-peter@korsgaard.com>
Message-ID: <87im7gzt4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Ups, s/fixed/fixes/ in the subject.

 > Fixes the following security issue:
 > - CVE-2021-3181: rfc822.c in Mutt through 2.0.4 allows remote attackers to
 >   cause a denial of service (mailbox unavailability) by sending email
 >   messages with sequences of semicolon characters in RFC822 address fields
 >   (aka terminators of empty groups).  A small email message from the
 >   attacker can cause large memory consumption, and the victim may then be
 >   unable to see email messages from other persons.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
