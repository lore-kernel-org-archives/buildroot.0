From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2009 13:54:03 +0000 (UTC)
Subject: [Buildroot] [Bug 559] mesa3d build fails
In-Reply-To: <bug-559-163@https.bugs.busybox.net/>
References: <bug-559-163@https.bugs.busybox.net/>
Message-ID: <20091201135404.1224F777B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=559





--- Comment #4 from Lionel Landwerlin <llandwerlin@gmail.com>  2009-12-01 13:54:03 UTC ---
(In reply to comment #3)
> Created an attachment (id=783)
 --> (https://bugs.busybox.net/attachment.cgi?id=783) [details]
> Pass LDFLAGS to the build config file
> 
> Without the LDFLAGS in the build configuration file
> building mesa3d fails with an external toolchain on amd64
> machines targeting i686.  The error indicates that libX11
> can't be found.
> 
> This change passes the --sysroot parameter (along with any
> others specified by buildroot for LDFLAGS to the mklib script.
> 

A few other packages have the same problem (tested with external toolchain
too), e2fsprogs for example.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
