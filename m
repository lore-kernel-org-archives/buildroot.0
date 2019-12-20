From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Dec 2019 14:57:33 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-QTYvw7lALC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Are you building Buildroot with the default of BR2_OPTIMIZE_S=y (which implies
using the -Os gcc optimization flag), or using BR2_OPTIMIZE_2=y or
BR2_OPTIMIZE_3=y ?

If you're using BR2_OPTIMIZE_S=y, could you try BR2_OPTIMIZE_2=y and
BR2_OPTIMIZE_3=y and see how much it changes things ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
