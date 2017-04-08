From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Apr 2017 08:30:51 +0000
Subject: [Buildroot] [Bug 9796] source-check broken for Git downloads
In-Reply-To: <bug-9796-163@https.bugs.busybox.net/>
References: <bug-9796-163@https.bugs.busybox.net/>
Message-ID: <bug-9796-163-H3KhFF4uCo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|source-check broken for     |source-check broken for Git
                   |Github downloads            |downloads

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Hum, I thought the defconfig was using an http download from Github, but indeed
it's using a Git download instead. So indeed, it's an issue with the Git
download helper.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
