From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2015 16:01:38 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150411160138.C96E4804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-11 16:01:38 UTC ---
Could you please indicate the Buildroot version you're using, and attach a
minimal Buildroot .config that exhibits the problem?

I'm routinely building system with just Busybox and strace, and it just works
fine for me, so there is probably something special in the configuration you're
using.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
