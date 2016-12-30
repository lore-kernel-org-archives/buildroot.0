From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:50:43 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-0OptB2cZAK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #18 from bilge at scriptfusion.com ---
Peter, sorry I must have misunderstood you. The build machine is a standard
Debian 8 image available as a Docker image from
https://hub.docker.com/r/dockernano/buildroot/. That build system certainly has
`env` present as well as the following Debian packages: build-essential
libncurses5-dev rsync cpio python unzip bc wget (as specified here:
https://github.com/Docker-nano/Buildroot/blob/2016.11/Dockerfile).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
