From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 22:38:49 +0200
Subject: [Buildroot] [PATCH 3/4] udev: replace "echo -en" with printf
In-Reply-To: <1400063214-29462-4-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 14 May 2014 12:26:53 +0200")
References: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1400063214-29462-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87mwehpig6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > printf is POSIX-compliant, echo -e/n is not.
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
