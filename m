From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Feb 2011 13:55:28 +0000 (UTC)
Subject: [Buildroot] [Bug 3259] Unable to build webkit (on arm).
In-Reply-To: <bug-3259-163@https.bugs.busybox.net/>
References: <bug-3259-163@https.bugs.busybox.net/>
Message-ID: <20110223135528.DA7978F69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3259

--- Comment #1 from Bart?omiej Palmowski <rotwang@crux.org.pl>  ---
I confirm webkit fails for i586 also,

./.libs/libJavaScriptCore.a(libJavaScriptCore_la-Lexer.o): In function
`JSC::isNonASCIIIdentStart(int)':
Lexer.cpp:(.text+0x15): undefined reference to `u_charType_44'

trying to build webkit 1.2.6 and 1.2.7

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
