From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 16:36:40 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB593EC4.2F2F%donald.poole@swri.org> (Donald R. Poole's message
 of "Thu, 9 Feb 2012 15:16:53 +0000")
References: <CB593EC4.2F2F%donald.poole@swri.org>
Message-ID: <87vcng3to7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

Hi,

 Donald> Hmm, interestingly I do have that in my .config.  Why would it
 Donald> have failed to execute the Setuid in this case?

Sorry, no idea. Do you see it in the fakeroot invocation to create the
tarball? Are the permissions in the tarball correct?

E.G.:
tar tvf output/images/rootfs.tar | grep '^-.*busybox'
-rwsr-xr-x root/root    420472 2012-02-09 09:29 ./bin/busybox

-- 
Bye, Peter Korsgaard
