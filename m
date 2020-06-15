From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jun 2020 13:09:54 +0000
Subject: [Buildroot] [Bug 13001] openjdk-bin replaces libfreetype.so from
 host-freetype
In-Reply-To: <bug-13001-163@https.bugs.busybox.net/>
References: <bug-13001-163@https.bugs.busybox.net/>
Message-ID: <bug-13001-163-ZhBsyWHEe4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

Jared Bents <jared.bents@rockwellcollins.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #8501|0                           |1
        is obsolete|                            |

--- Comment #3 from Jared Bents <jared.bents@rockwellcollins.com> ---
Created attachment 8506
  --> https://bugs.busybox.net/attachment.cgi?id=8506&action=edit
proposed patch to fix v2

Updated proposed patch to use post extract hook and include three more
libraries

- libzip.so, by package libzip
- libnet.so, by package libnet; added host variant
- libsctp.so, by package lksctp-tools; added host variant

-- 
You are receiving this mail because:
You are on the CC list for the bug.
