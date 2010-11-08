From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Nov 2010 17:07:33 +0000 (UTC)
Subject: [Buildroot] [Bug 2773] squid with openssl support needs openssl on
	the host
In-Reply-To: <bug-2773-163@https.bugs.busybox.net/>
References: <bug-2773-163@https.bugs.busybox.net/>
Message-ID: <20101108170733.4E2318DC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2773

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Fix/bump in my repo
http://repo.or.cz/w/buildroot-gz.git/commitdiff/e79f9914b49eecf523ce469cfe146cde99f1097d
No need for host-openssl now.
Give it a spin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
