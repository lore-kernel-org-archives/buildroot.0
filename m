From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Dec 2011 10:34:17 +0000 (UTC)
Subject: [Buildroot] [Bug 4622] Unable to download properly file
	fakeroot_1.9.5.tar.gz
In-Reply-To: <bug-4622-163@https.bugs.busybox.net/>
References: <bug-4622-163@https.bugs.busybox.net/>
Message-ID: <20111219103417.A44C98FAB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4622

--- Comment #5 from arco at ieec.uab.es 2011-12-19 10:34:17 UTC ---
Following the make file development...

--2011-12-19 11:25:34-- 
http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot//fakeroot_1.9.5.tar.gz
Resolving snapshot.debian.net... 193.62.202.30,
2001:630:206:4000:1a1a:0:c13e:ca1e
Connecting to snapshot.debian.net|193.62.202.30|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://snapshot.debian.org/ [following]
--2011-12-19 11:25:48--  http://snapshot.debian.org/
Resolving snapshot.debian.org... 193.62.202.30,
2001:630:206:4000:1a1a:0:c13e:ca1e
Reusing existing connection to snapshot.debian.net:80.
HTTP request sent, awaiting response... 200 OK
Length: 14143 (14K) [text/html]
Saving to:
`/home/darwin/arco/Documents/linuxbuild-1.0.1/dist/buildroot/downloads/fakeroot_1.9.5.tar.gz'

Hope it is useful

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
