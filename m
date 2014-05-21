From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 10:46:00 +0200
Subject: [Buildroot] [PATCH v2 2/2] infra: pkg-utils.mk replace "echo
	-en" with printf
In-Reply-To: <1400660710-15758-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 21 May 2014 10:25:10 +0200")
References: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1400660710-15758-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <874n0jfrjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > printf is POSIX-compliant, echo -e/n is not.

This place didn't actually use 'echo -n', so I've adjusted the commit
message and committed, thanks.

-- 
Bye, Peter Korsgaard
