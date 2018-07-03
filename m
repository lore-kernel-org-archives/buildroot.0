From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Jul 2018 22:24:03 +0000
Subject: [Buildroot] [Bug 11116] Buildroot should set PYTHON_EGG_CACHE
 instead of writing files to ~/.python-eggs
In-Reply-To: <bug-11116-163@https.bugs.busybox.net/>
References: <bug-11116-163@https.bugs.busybox.net/>
Message-ID: <bug-11116-163-rUxvPjfTlG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11116

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
If I understand correctly, the problem is not that building a Python package
will write something to $HOME/.python-eggs (because as far as I can see, it
doesn't), but rather, that packages installed in $HOME/.python-eggs would
influence the build result when you run host-python, is that correct?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
