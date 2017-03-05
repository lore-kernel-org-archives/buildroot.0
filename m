From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 Mar 2017 15:51:03 +0000
Subject: [Buildroot] [Bug 9711] Recent libCEC version bump seems to break
	kodi package
In-Reply-To: <bug-9711-163@https.bugs.busybox.net/>
References: <bug-9711-163@https.bugs.busybox.net/>
Message-ID: <bug-9711-163-IxwrhG5UW4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

--- Comment #6 from RiZom-91 <rizom91@openaliasbox.org> ---
Ok I wrote too quickly. The issue is still here (thought I was crazy xD). I've
attached the error trace.

I'll try without my changes just to be sure, but with "minor changes" I was
talking about changing hostname and things like that. I think it is still very
close to what the buildroot folder was at the beginning.

With "add kodi", I meant select the kodi package with the CEC option and
obviously select dependencies of kodi as well.

"kodi-cec" adds the HDMI CEC communication protocol to Kodi (allowing to
control the interface with the TV remote.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
