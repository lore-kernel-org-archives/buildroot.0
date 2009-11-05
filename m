From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2009 16:18:42 +0000 (UTC)
Subject: [Buildroot] [Bug 515] tcpreplay: new package
In-Reply-To: <bug-515-163@https.bugs.busybox.net/>
References: <bug-515-163@https.bugs.busybox.net/>
Message-ID: <20091105161842.64FD2777D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=515


Chris Packham <judge.packham@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #707 is|0                           |1
           obsolete|                            |




--- Comment #8 from Chris Packham <judge.packham@gmail.com>  2009-11-05 16:18:41 UTC ---
Created an attachment (id=715)
 --> (https://bugs.busybox.net/attachment.cgi?id=715)
Patch to expose the libpcap headers

The commit 057568255 (autotoolify of libpcap) inadvertently stopped the pcap.h
header file from being installed into the staging directory. This patch always
calls make install (instead of install-strip) when installing into the staging
directory.

This is the same patch as attachment 707 just with the email address I use to
post to the list.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
