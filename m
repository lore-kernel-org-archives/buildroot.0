From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Feb 2014 12:17:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6938] mkuser script generates wrong password for
 new user in target/etc/shadow
In-Reply-To: <bug-6938-163@https.bugs.busybox.net/>
References: <bug-6938-163@https.bugs.busybox.net/>
Message-ID: <20140227121724.16F399BB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6938

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-27 12:17:23 UTC ---
Please describe in more detail the problems you are experiencing, otherwise we
cannot help you.

- What is the problem with the passwords generated from the script?
- How are you using the script?
- Which password method have you configured (BR2_TARGET_GENERIC_PASSWD_METHOD)
- If you are using SHA256 or SHA512, are you sure that the busybox application
(assuming you are using it) is configured with the following option:
CONFIG_USE_BB_CRYPT_SHA ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
