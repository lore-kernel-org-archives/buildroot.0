From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 07:26:45 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/asterisk
In-Reply-To: <20090126001613.9F458775F4@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 00\:16\:12 +0000 \(UTC\)")
References: <20090126001613.9F458775F4@busybox.osuosl.org>
Message-ID: <87tz7mbn16.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 00:16:11 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25040

 ulf> Log:
 ulf> Add comment on brokenness of Asterisk

The patch is easy to fix, just remove it. The bigger problem is that
the build process has changed significantly since 1.2.0, so I'll mark
it as broken instead.

If someone wants to fix it up, please do (and remove BROKEN).

-- 
Bye, Peter Korsgaard
