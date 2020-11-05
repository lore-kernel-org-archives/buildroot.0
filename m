From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Nov 2020 16:35:38 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-iimFl8cisw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
(In reply to Heiko Thiery from comment #1)
Do you need to pass both DYNAMIC=something *and* SHARED=something ? This seems
a bit redundant. According to what you did in
8d38eb052e7006b6e74e9453351d7f245144481e, it seems that DYNAMIC has gone away,
and SHARED is the new variable to use ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
