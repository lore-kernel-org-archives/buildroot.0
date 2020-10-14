From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2020 11:45:38 +0000
Subject: [Buildroot] [Bug 13261] When doing lldpd 1.0.4 Configuring,
 error encountered: "checking if system libevent works as
 expected... configure: error: *** unusable system libevent"
In-Reply-To: <bug-13261-163@https.bugs.busybox.net/>
References: <bug-13261-163@https.bugs.busybox.net/>
Message-ID: <bug-13261-163-WoBGurFxRw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13261

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #6 from Thomas De Schampheleire <patrickdepinguin@gmail.com> ---
Problem is caused by internal changes in our tree (only the 'core' component of
libevent being build, thus no libevent.so).

Closing as invalid.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
