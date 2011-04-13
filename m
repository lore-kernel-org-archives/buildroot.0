From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Apr 2011 16:59:48 +0000 (UTC)
Subject: [Buildroot] [Bug 3415] dnsmasq: add dbus support to config menu
In-Reply-To: <bug-3415-163@https.bugs.busybox.net/>
References: <bug-3415-163@https.bugs.busybox.net/>
Message-ID: <20110413165948.3706A825DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3415

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---

Many optional support options are automatic in buildroot, like SSL (via
OpenSSL) for example.
We want to avoid the "option overload" scenario so i'd say "WONTFIX".

Peter and/or other devels are free to reopen but this has been standard issue
for quite some time now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
