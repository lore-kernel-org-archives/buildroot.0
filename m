From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 02:47:18 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix build failure
In-Reply-To: <1413144879-26661-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 12 Oct 2014 22:14:39 +0200")
References: <1413144879-26661-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87oat15621.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Correctly set NGX_SYS_NERR, even when it is 0.
 > Fixes:
 >   http://autobuild.buildroot.org/results/666/666d780bf61e10c9f89f765bb04ddc1afc11d0d1/
 >   http://autobuild.buildroot.org/?reason=nginx-1.6.2&&arch=powerpc

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
