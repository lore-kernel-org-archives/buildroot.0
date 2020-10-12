From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Oct 2020 09:29:20 +0000
Subject: [Buildroot] [Bug 13251] cryptsetup does not work on branch 2020.02
 following json-c upgrade
In-Reply-To: <bug-13251-163@https.bugs.busybox.net/>
References: <bug-13251-163@https.bugs.busybox.net/>
Message-ID: <bug-13251-163-IHdxxuOIFO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13251

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Dominique Tronche from comment #2)
Good to hear. On the LTS branch we only bump package versions if absolutely
needed. The 2.3.x version brings new features, so it is "safer" to just fix the
compatibility issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
