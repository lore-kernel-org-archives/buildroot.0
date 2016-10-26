From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Oct 2016 12:22:51 +0000
Subject: [Buildroot] [Bug 9381] check-host-rpath issues
In-Reply-To: <bug-9381-163@https.bugs.busybox.net/>
References: <bug-9381-163@https.bugs.busybox.net/>
Message-ID: <bug-9381-163-K25kQDmGmk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9381

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Jean-pierre Cartal from comment #2)

> Do you know if there is any plan to support the $ORIGIN ld feature ?

Yes. Samuel sent patches doing this, which we discussed during the latest
Buildroot Developers Meeting. However, we felt that a better approach was to
improve the patchelf utility, so Samuel is normally working on this. Don't
hesitate to get in touch with Samuel Martin to see if he needs help on this
topic.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
