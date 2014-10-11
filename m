From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Oct 2014 15:31:37 +0200
Subject: [Buildroot] [PATCH] canfestival: fix build failure
In-Reply-To: <1412979947-29774-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 11 Oct 2014 00:25:47 +0200")
References: <1412979947-29774-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87oati7mx2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Some canfestival python build scripts are not python2 compliant.
 > So, this patch add a patch allowing to set the python interperter and
 > set it in the make environment. This pulls a host-python dependency on
 > canfestival.

 > This patch has been sent upstream: [1].

 > Fixes:
 >   http://autobuild.buildroot.net/results/98d/98dce833dfa8255522af672d4f41c2504c00e64e/

 > [1] http://sourceforge.net/p/canfestival/mailman/message/32919038/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
