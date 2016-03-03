From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 22:33:26 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-85d99PHsrp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #8 from Kenric Smith <ksmith@aesaustin.com> ---
Confirmed setting ENABLE_FEATURE_PREFER_IPV4_ADDRESS also corrects the
behavior. 

I personally still think forcing IPV6 in Busybox isn't great, but I also
understand if you don't want to change the configuration.

Feel free to close the issue as resolved, if you want to change the forced IPV6
in Busybox is up to you. (it results in a 20% larger executable for me)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
