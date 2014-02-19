From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 21:56:15 +0100
Subject: [Buildroot] [PATCH] infra: Change BR2_HOST_NEEDS_JAVA name
In-Reply-To: <1392824030-3871-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 19 Feb 2014 16:33:50 +0100")
References: <1392824030-3871-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87r46yzus0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Change BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA as it makes more
 > sense.
 > The host doesn't need Java but Buildroot needs the host to have
 > Java in order to build the package that select this option.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  Config.in                            | 2 +-
 >  support/dependencies/dependencies.sh | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
