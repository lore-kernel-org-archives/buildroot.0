From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Apr 2016 07:34:41 +0000
Subject: [Buildroot] [Bug 8856] python tornado runtime wasn't met on
	buildroot 2016.02
In-Reply-To: <bug-8856-163@https.bugs.busybox.net/>
References: <bug-8856-163@https.bugs.busybox.net/>
Message-ID: <bug-8856-163-dLf1HC5BFc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8856

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Looks good overall. Could you submit this as proper patches to the mailing
list?

It should be two patches:

 1/ One adding the python-backports-ssl-match-hostname package

 2/ One fixing the python-tornado package to select
python-backports-ssl-match-hostname

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
