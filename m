From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Aug 2014 19:09:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140814190941.838009D439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

--- Comment #8 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-14 19:09:41 UTC ---
Thanks for this further investigation and fix!

Using 'yum whatprovides /usr/share/config.site' I was able to determine that
this file is installed by the 'autoconf' package. Since my Fedora installation
does not have autoconf installed, I could not reproduce the bug. 
Copying your config.site file manually indeed causes the bug for me too.

I tested your patch successfully. I will provide this feedback on the mailing
list. Once your patch is applied, we can close this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
