From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Oct 2013 08:10:50 +0200
Subject: [Buildroot] [PATCH] Makefile: revert BUILD_DIR export
In-Reply-To: <1382638285-8118-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 24 Oct 2013 15:11:25 -0300")
References: <1382638285-8118-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y55h7udx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Revert commit feb0877015cc0c644129e69276b3000c83742750
 > U-Boot uses $(BUILD_DIR) and causes issues, other packages might as
 > well. Fixes:
 > http://autobuild.buildroot.net/results/1f6/1f65289d5c284caa82a4e9137613f792797ee08a/
 > http://autobuild.buildroot.net/results/6a5/6a5f77483e908dc96d08824cf9113402431bace7/

 > It should probably be named somewhat more uniquely.

Committed, thanks.

-- 
Bye, Peter Korsgaard
