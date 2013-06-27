From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Jun 2013 08:46:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6338] Wrong download link for minicom package
In-Reply-To: <bug-6338-163@https.bugs.busybox.net/>
References: <bug-6338-163@https.bugs.busybox.net/>
Message-ID: <20130627084638.DE8869B216@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6338

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2013-06-27 08:44:45 UTC ---
What's wrong about it? It seems to work here:

wget http://alioth.debian.org/frs/download.php/3700/minicom-2.6.1.tar.gz
--2013-06-27 10:43:28-- 
http://alioth.debian.org/frs/download.php/3700/minicom-2.6.1.tar.gz
Resolving alioth.debian.org (alioth.debian.org)... 217.196.43.134
Connecting to alioth.debian.org (alioth.debian.org)|217.196.43.134|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 0 [text/html]
Saving to: `minicom-2.6.1.tar.gz'

    [ <=>                                   ] 0           --.-K/s   in 0s      

2013-06-27 10:43:28 (0.00 B/s) - `minicom-2.6.1.tar.gz' saved [0/0]

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
