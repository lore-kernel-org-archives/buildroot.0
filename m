From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Oct 2020 21:10:20 +0000
Subject: [Buildroot] [Bug 13251] cryptsetup does not work on branch 2020.02
 following json-c upgrade
In-Reply-To: <bug-13251-163@https.bugs.busybox.net/>
References: <bug-13251-163@https.bugs.busybox.net/>
Message-ID: <bug-13251-163-iTKEIuk4oK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13251

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks for the report, should be fixed by
https://patchwork.ozlabs.org/project/buildroot/patch/20201011210738.22951-1-peter at korsgaard.com/
- Can you verify please?

It would be good with a runtime test for cryptsetup.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
