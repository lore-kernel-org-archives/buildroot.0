From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 11:15:44 +0200
Subject: [Buildroot] [PATCH] at91bootstrap: Disable parallel build
In-Reply-To: <1369816597-6221-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 May 2013 10:36:37 +0200")
References: <1369816597-6221-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87y5ay6ta7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The at91bootstrap build sometimes fail when doing parallel builds.
 Maxime> Build it without parallel build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
