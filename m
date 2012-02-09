From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 07:29:08 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB585E3C.2EF2%donald.poole@swri.org> (Donald R. Poole's message
 of "Wed, 8 Feb 2012 23:17:36 +0000")
References: <CB585E3C.2EF2%donald.poole@swri.org>
Message-ID: <871uq44j0r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

Hi,

 >> But in your original email you told us that you were getting that
 >> error. What changed?

 Donald> Ok, I found the problem. /bin/busybox wasn't setuid
 Donald> root. Changing the uid to root fixed the problem.  I thought
 Donald> buildroot did this automatically after installing to target?

If you extract the tarball to your nfsroot as root, yes (or use one of
the other filesystem outputs). You are not trying to use output/target
directly, are you?

-- 
Bye, Peter Korsgaard
