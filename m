From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Nov 2020 12:05:01 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-RZj8vk52aI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

--- Comment #15 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
tested-by:
    Reverting the previous patch 
    Testing that the build then failed. it did.
    Added the attached patch (0000-kernel.org-bug-210135.patch) to
<GLOBAL_PATCHES>/libcap/2.54
    Cleaning the build area
    Rebuilding

Result:
    host-libcap once again build.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
