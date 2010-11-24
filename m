From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Nov 2010 04:16:52 +0000 (UTC)
Subject: [Buildroot] [Bug 2839] compile fails in various packages with a odd
 message "error: impossible constraint in 'asm'"
In-Reply-To: <bug-2839-163@https.bugs.busybox.net/>
References: <bug-2839-163@https.bugs.busybox.net/>
Message-ID: <20101124041652.CA5BD8DC1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2839

--- Comment #9 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #7)
> Try using gcc 4.3.x instead of the (experimental) 4.5.x, this will probably fix
> most of your constraint issues.
> Since gcc 4.4+ MIPS became more sensitive to some optimizations thus breaking
> some source code.
> 
> libmad is fixed in git.
> libgcrypt will probably be fixed soon (fixed in my tree
> GMP will have to wait IMHO since it's pretty tied up to the internal toolchain.
> I've got a fix for it but don't expect it to ship for the 2010.11 release since
> it's part of an internal toolchain revamp.

After back to gcc 4.3 and with lastest git I had also compile libgcrypt and
GMP.

so may be we can close the bug has fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
