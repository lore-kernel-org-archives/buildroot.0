From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 14:10:11 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-Me2AasMl0V@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #5 from Doug Kehn <rdkehn@yahoo.com> ---
Sorry, my comments didn't get associated with the patch.

Thomas is correct, the stock Buildroot sudo.pam does not work 'out of the box'
with LDAP. I had modified /etc/pam.d/sudo to adhere to desired security policy.

The patch gets /etc/pam.d/sudo working with LDAP for me. Please try and let me
know if it solves your issue. I don't mind doing a proper patch if it does.

Regards,
...doug

-- 
You are receiving this mail because:
You are on the CC list for the bug.
