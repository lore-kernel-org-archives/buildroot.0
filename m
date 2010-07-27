From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 05:34:58 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100727053458.5C47D82B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651

--- Comment #9 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #8)

> but what should I do ? disable CCACHE or use glibc-static  ?

short of us hacking the module-init-tools makefile, it is building a static
version of insmod - So I would say install the glibc package.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
