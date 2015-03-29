From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2015 17:24:55 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150329172455.D8F63807C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

--- Comment #9 from Tom Elliott <tommygunsster@gmail.com> 2015-03-29 17:24:55 UTC ---
There's a few things have to be taken into consideration for this to work.

First, you need the structure laid out for the customizations we have.

Here's a breakdown of what I need to do.

I build on debian 7.8 x86_64 for now:

Download the structure we need from:

http://sourceforge.net/p/freeghost/code/HEAD/tree/trunk/src/buildroot/

Copy the files inside to your buildroot's extracted folder.

Copy the fog.buildroot.config.64 to .config

Then try building.

This is the simplest I can tell you for right now.  Hopefully it's helpful
enough and if you need help I'm right here.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
