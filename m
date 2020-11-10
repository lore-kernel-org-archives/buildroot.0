From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2020 09:33:53 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-eEGFDc9P7R@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

Heiko Thiery <heiko.thiery@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #8631|0                           |1
        is obsolete|                            |
   Attachment #8636|0                           |1
        is obsolete|                            |
                 CC|                            |heiko.thiery at gmail.com

--- Comment #11 from Heiko Thiery <heiko.thiery@gmail.com> ---
Created attachment 8656
  --> https://bugs.busybox.net/attachment.cgi?id=8656&action=edit
third iteration of the patch

I added a patch for libcap that should prevent adding the --static flag. Please
give it a try.

I also started a request to the libcap maintainer get feedback if this is the
correct way.

Thank you

-- 
You are receiving this mail because:
You are on the CC list for the bug.
