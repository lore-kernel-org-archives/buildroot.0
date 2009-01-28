From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 19:51:10 +0000 (UTC)
Subject: [Buildroot] [Bug 79] No version-number for the Freetype-package
In-Reply-To: <bug-79-163@https.bugs.busybox.net/>
References: <bug-79-163@https.bugs.busybox.net/>
Message-ID: <20090128195110.C15537649C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=79





--- Comment #2 from Jan Kretschmer <kretschi@online.de>  2009-01-28 19:51:09 UTC ---
Hm, I'm confused - I see, that I've never chosen freetype to be build
Therefore my .config says:

# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_FREETYPE_VERSION_2_2_1 is not set
# BR2_FREETYPE_VERSION_2_3_7 is not set

But why does it build freetype - trying to do so, is better to say :D
I already took a clean svn-tree to avoid false errors.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
