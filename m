From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 22:56:12 +0200
Subject: [Buildroot] [PATCHv2] integrator926: Update the defconfig
In-Reply-To: <1365762089-28023-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 12 Apr 2013 12:21:29 +0200")
References: <1365762089-28023-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87wqrq8h3n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> the integrator926 defconfig has not been updated for quite some time,
 Maxime> and is still asking for very old linux and u-boot releases. Now that
 Maxime> these versions aren't present in Buildroot anymore, they default to a
 Maxime> newer release, where, in the u-boot case, the defconfig name has
 Maxime> changed, leading to a build failure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
