From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2013 15:05:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130227150529.B37589ADC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2013-02-27 15:05:53 UTC ---
(In reply to comment #0)
> I was trying to build Erlang int the latest RC (2013.02-rc3) for arm.
> It did not recognize the platform correctly and, as a result, did not build.
> Here is an excerpt from the log file:
> ________________________________________________________________________
> >>> host-erlang R15B01 Patching libtool
> >>> host-erlang R15B01 Configuring

As the comment says, this is erlang for the host (which is a dependency of
erlang for the target).

You didn't paste any error message, what exactly is not working?

> (cd /root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/ && rm -rf

Please don't build as root!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
