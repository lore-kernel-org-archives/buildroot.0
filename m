From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:17:00 +0200
Subject: [Buildroot] [PATCH] libmatroska: properly support static-only
	build
In-Reply-To: <1410012627-20563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 16:10:27 +0200")
References: <1410012627-20563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4twmrlv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This is similar to commit 9cef35b68f33ac1f332784fdfef61d3904c7db41 on
 > libebml, since libmatroska uses the same Makefile logic as libebml. It
 > makes sure BR2_PREFER_STATIC_LIB=y succeed by not building the shared
 > library in this case.

 > Fixes:

 >   http://autobuild.buildroot.org/results/12e/12e752330b30adb5078acd72a548cc172fa9ecb8/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
