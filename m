From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 16:54:01 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: remove nommu option for MIPS
In-Reply-To: <1399482605-1850-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 7 May 2014 14:10:04 -0300")
References: <1399482605-1850-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9ascody.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > MIPS nommu never took off, the only MIPS processors without MMU are
 > microcontrollers and the only uclinux effort for them has non-upstream
 > patches against very very old versions.
 > See http://www.xiptech.com/uclinuxformips.htm

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
