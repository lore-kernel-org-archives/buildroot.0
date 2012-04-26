From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Apr 2012 15:22:30 +0200
Subject: [Buildroot] [PATCH resend] Add the www-data user group to the
	skeleton target filesystem
In-Reply-To: <1334916535-8866-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 20 Apr 2012 11:08:55 +0100")
References: <1334916535-8866-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ipgmaaqx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> The www-data user is defined in fs/skeleton/etc/passwd, with gid 33. But
 spdawson> gid 33 is not present in the group file.

Committed, thanks.

-- 
Bye, Peter Korsgaard
