From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2013 15:05:39 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130227150539.87A769ADC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-02-27 15:06:03 UTC ---
The log you've copy/pasted shows the configuration step of the host-erlang
package, i.e when we build Erlang for your development PC. Therefore, it is
perfectly normal that the detected host platform is i686-pc-linux-gnu.

Could you instead post the real build failure you're seeing?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
