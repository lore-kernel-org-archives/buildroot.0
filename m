From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jun 2020 13:29:56 +0000
Subject: [Buildroot] [Bug 13001] openjdk-bin replaces libfreetype.so from
 host-freetype
In-Reply-To: <bug-13001-163@https.bugs.busybox.net/>
References: <bug-13001-163@https.bugs.busybox.net/>
Message-ID: <bug-13001-163-wWPVqqLI67@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

--- Comment #1 from Jared Bents <jared.bents@rockwellcollins.com> ---
Created attachment 8501
  --> https://bugs.busybox.net/attachment.cgi?id=8501&action=edit
proposed patch to fix

The proposed patch to fix the issue removes libfreetype.so and adds
host-freetype dependency

-- 
You are receiving this mail because:
You are on the CC list for the bug.
