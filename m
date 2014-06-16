From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jun 2014 18:58:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140616185848.04F719D006@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #13 from Krzysztof Wrzalik <kwrzalik@gmail.com> 2014-06-16 18:58:47 UTC ---
If I'm looking at the right place, TARGET_DL_ITERATE_PHDR is defined in
output/build/host-gcc-final-4.9.0/gcc/configure.ac at line 5079. It looks like
it only gets set on a variant of solaris2. So this variable looks like a quick
hack to me rather than something one can depend on.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
