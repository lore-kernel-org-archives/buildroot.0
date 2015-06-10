From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jun 2015 09:00:34 +0000 (UTC)
Subject: [Buildroot] [Bug 8066] nodejs crashes when built with gcc 4.9
In-Reply-To: <bug-8066-163@https.bugs.busybox.net/>
References: <bug-8066-163@https.bugs.busybox.net/>
Message-ID: <20150610090034.A5FFF81E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8066

--- Comment #5 from Dr I J Ormshaw <ian_ormshaw@waters.com> 2015-06-10 09:00:34 UTC ---
I've re-created the issue and attached the good and bad config files, I've also
attaches the differences between the two, as a patch.

The version of buildroot I am using is

2015.02
6bf057b0f2ba188397a691f74877a4a30aaea3f9

The console output for the failure is:


[root at buildroot ~]# node
traps: node[194] general protection ip:736725 sp:7ffc3c721350 error:0 in
node[400000+73c000]
Segmentation fault

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
