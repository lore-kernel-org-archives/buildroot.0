From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 10:42:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] acpid: replace "echo -e" with printf
In-Reply-To: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 21 May 2014 10:25:09 +0200")
References: <1400660710-15758-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878upvfrqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > printf is POSIX-compliant, echo -e is not.
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > ---
 > Changes v1 -> v2:
 >     - Added trailing \n (Peter Korsgaard)

Committed, thanks.

-- 
Bye, Peter Korsgaard
