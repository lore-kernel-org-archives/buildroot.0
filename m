From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  9 Nov 2013 21:55:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6668] iptables limit module alignment problem on
	mips64
In-Reply-To: <bug-6668-163@https.bugs.busybox.net/>
References: <bug-6668-163@https.bugs.busybox.net/>
Message-ID: <20131109215541.E7B8C8F6F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6668

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX
           Severity|critical                    |normal

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-09 21:55:41 UTC ---
1) This isn't critical - if you want something fixed then you should at least
be polite and don't think about your little corner only.
Critical would be something minimal not building, for example a basic root
filesystem with just busybox with a default configuration.
Iptables is just one package among many, and the failure is a subset of the
functionality of iptables on a subset of many architectures.

2) This is an upstream bug, unless there's a patch or knob to signal the
iptables build about mixed 64/32 kernel/userland (which was present several
releases ago IIRC) or fixing this issue then there's nothing we can do on our
side alone - you should contact the netfilter devels about this issue since
it's a bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
