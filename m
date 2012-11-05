From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Nov 2012 09:14:56 +0100
Subject: [Buildroot] [PATCH 1/2] Add missing dependency to netatalk
In-Reply-To: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 4 Nov 2012 20:25:22 +0100")
References: <1352057123-7137-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87ehk8pitb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> Netatalk need pkg-config, otherwise the configure script is complaining.

Next to the comment of Thomas, also remember to sign off on your patches
(-s argument to git commit).

-- 
Bye, Peter Korsgaard
