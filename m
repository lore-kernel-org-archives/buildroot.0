From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:39:04 +0100
Subject: [Buildroot] [PATCH] sane-backends: fix documentation build
	failure
In-Reply-To: <1355063702-4716-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 9 Dec 2012 11:35:02 -0300")
References: <1355063702-4716-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vccbvu3b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable documentation build, it seems to break with older
 Gustavo> texlive/kpathsea versions, fixes:
 Gustavo> http://autobuild.buildroot.net/results/44327b543d8918929bf252c5284e8691fda87fd0/
 Gustavo> Also switch to alioth mirror since the original tarball is
 Gustavo> gone from the regular site when 1.0.23 was released.

Did you have a look at moving to 1.0.23 instead?

-- 
Bye, Peter Korsgaard
